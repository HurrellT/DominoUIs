package org.domino.arena

import java.util.List
import org.domino.dominio.Cancelado
import org.domino.dominio.EnViaje
import org.domino.dominio.Entregado
import org.domino.dominio.EstadoPedido
import org.domino.dominio.ListoParaEnviar
import org.domino.dominio.ListoParaRetirar
import org.domino.dominio.Pedido
import org.domino.dominio.Pizza
import org.domino.dominio.Plato
import org.domino.dominio.Preparando
import org.domino.repo.RepoPedidos
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

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

		new Selector<EstadoPedido>(panelEstado) => [
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
		 // modelObject.pedido.platos.add(new Plato())
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

	override executeTask() {
		if (modelObject.pedido.isNew) {
			repoPedidos.create(modelObject.pedido)
		} else {
			repoPedidos.update(modelObject.pedido)
		}
		super.executeTask()
	}

	def RepoPedidos getRepoPedidos() {
		ApplicationContext.instance.getSingleton(typeof(Pedido))
	}
}

@Accessors
@Observable
class RepoEstados {

	List<EstadoPedido> estados = #[new Cancelado, new Entregado, new EnViaje, new ListoParaEnviar, new ListoParaRetirar,
		new Preparando]
		
		

}
