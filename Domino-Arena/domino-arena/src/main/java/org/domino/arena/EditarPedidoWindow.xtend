package org.domino.arena

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import org.domino.dominio.*
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.ObservableProperty
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import scala.xml.dtd.ContentModel.ElemName
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.bindings.DateTransformer
import org.uqbar.commons.model.annotations.Observable
import java.time.LocalDateTime
import org.uqbar.arena.windows.Dialog

class EditarPedidoWindow extends TransactionalDialog<AppPedidoAplicationModel> {

	new(WindowOwner owner, AppPedidoAplicationModel model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {

		/*
		 * Main Panel
		 */
		title = "Pedido #" + modelObject.pedido.numeroDePedido

		/*
		 * Panel de estado
		 */
		val panelEstado = new Panel(mainPanel)

		panelEstado.layout = new HorizontalLayout()

		new Label(panelEstado).text = "Estado"

		new Selector<Pedido>(panelEstado) => [
			allowNull(false)
			value <=> "pedido.estado"
			bindItems(new ObservableProperty(repoEstados, "estados")).adaptWith(typeof(EstadoPedido), "nombre")
		]

		/*
		 * Panel de platos
		 */
		val panelPlatos = new Panel(mainPanel)
		panelPlatos.layout = new HorizontalLayout

		new Label(panelPlatos).text = "Platos"

		val table = new Table<Plato>(panelPlatos, typeof(Plato)) => [
			items <=> "pedido.platos"
			value <=> "platoSeleccionado"
//			numberVisibleRows = 12
		]

		this.describirTablaDePlatos(table)

		val buttonPanel = new Panel(panelPlatos)

		this.crearBotones(buttonPanel)

		/*
		 * Panel de aclaraciones
		 */
		val panelAclaracion = new Panel(mainPanel)
		panelPlatos.layout = new HorizontalLayout

		new Label(panelAclaracion).text = "Aclaraciones"

		new TextBox(panelAclaracion) => [
			value <=> "pedido.aclaracion"
			height = 200
			width = 200
		]

		/*
		 * Panel de datos
		 */
		val panelDatos = new Panel(mainPanel)
		panelDatos.layout = new ColumnLayout(2)

		this.crearPanelDeDatos(panelDatos)

		/*
		 * Panel de botones
		 */
		val panelBotones = new Panel(mainPanel)
		panelBotones.layout = new HorizontalLayout

		new Button(panelBotones) => [
			caption = "Aceptar"
			onClick[this.accept]
		]

		new Button(panelBotones) => [
			caption = "Cancelar"
			onClick[this.close]
		]

	}

	def crearPanelDeDatos(Panel panelDatos) {
		new Label(panelDatos).text = "Cliente"
		new Label(panelDatos) => [
			value <=> "pedido.cliente.nombre"
		]
		new Label(panelDatos).text = "Costo de envio"
		new Label(panelDatos) => [
			value <=> "pedido.envio.recargo"
		]
		new Label(panelDatos).text = "Monto total"
		new Label(panelDatos) => [
			value <=> "pedido.montoTotal"
		]
		new Label(panelDatos).text = "Fecha"
		new Label(panelDatos) => [
			value <=> 'fechaTransformada'
		]
	}

	def crearBotones(Panel panel) {

		new Button(panel) => [
			caption = "Agregar"
			onClick [this.crearPlato]
			//		modelObject.pedido.platos.add(new Plato())
		]

		new Button(panel) => [
			caption = "Editar"
			onClick [this.editarPlato]

			enabled <=> "hayPlatoSeleccionado"

		]

		new Button(panel) => [
			caption = "Eliminar"
			onClick [modelObject.pedido.platos.remove(modelObject.platoSeleccionado)]
		]
	}

	def describirTablaDePlatos(Table<Plato> table) {

		new Column<Plato>(table) => [
			title = "Pizza"
			fixedSize = 200
			bindContentsToProperty("pizza").transformer = [ Pizza p |
				p.nombre
			]
		]

//		new Column<Plato>(table) => [
//			title = "Tamaño"
//			fixedSize = 200
//			bindContentsToProperty("tamanio") //ADAPTER?
//		]
//		new Column<Plato>(table) => [
//			title = "Ingredientes"
//			fixedSize = 200
//			bindContentsToProperty("ingredientes")
//		]
	}

	def editarPlato() {
		this.openDialog(new EditarPlatoWindow(this, modelObject.platoSeleccionado))
	}

	def crearPlato() {
		this.openDialog(new CrearPlatoWindow(this))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.open
	}

	def getRepoEstados() {
		var repo = new RepoEstados()
		repo
	}

}

@Accessors
@Observable
class RepoEstados {

	List<EstadoPedido> estados = #[new Cancelado, new Entregado, new EnViaje, new ListoParaEnviar, new ListoParaRetirar,
		new Preparando]

}
