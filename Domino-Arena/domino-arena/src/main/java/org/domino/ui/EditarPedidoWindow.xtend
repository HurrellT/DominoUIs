package org.domino.ui

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
import org.domino.dominio.Tamanio
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
import org.uqbar.commons.model.annotations.Transactional

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.domino.model.PedidoApplicationModel
import org.domino.model.PlatoApplicationModel

@Transactional
class EditarPedidoWindow extends TransactionalDialog<PedidoApplicationModel> {

	new(WindowOwner owner, PedidoApplicationModel model) {
		super(owner, model)
	}

// ********************************************************
// ** Creacion de paneles
// ********************************************************
	override protected createFormPanel(Panel mainPanel) {

		title = "Pedido #" + modelObject.pedido.numeroDePedido

		val panelEstado = new Panel(mainPanel)
		panelEstado.layout = new HorizontalLayout()

		this.crearPanelEstado(panelEstado)

		val panelPlatos = new Panel(mainPanel)
		panelPlatos.layout = new HorizontalLayout

		this.crearPanelPlatos(panelPlatos)

		val buttonPanel = new Panel(panelPlatos)

		this.crearBotonesParaPlatos(buttonPanel)

		val panelAclaracion = new Panel(mainPanel)

		new Label(panelAclaracion).text = "Aclaraciones"

		new TextBox(panelAclaracion) => [
			value <=> "pedido.aclaracion"
			enabled <=> "pedido.esAbierto"
			height = 200
			width = 200
		]

		val panelDatos = new Panel(mainPanel)
		panelDatos.layout = new ColumnLayout(2)

		this.crearPanelDeDatos(panelDatos)

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

// ********************************************************
// ** Creacion del panel de estado
// ********************************************************
	def crearPanelEstado(Panel panelEstado) {
		new Label(panelEstado).text = "Estado"

		new Selector<EstadoPedido>(panelEstado) => [
			allowNull(false)
			value <=> "estadoSeleccionado"
			enabled <=> "pedido.esAbierto"
			bindItems(new ObservableProperty(repoEstados, "estados")).adaptWith(typeof(EstadoPedido), "nombre")
		]
	}

// ********************************************************
// ** Creacion del panel de platos
// ********************************************************
	def crearPanelPlatos(Panel panelPlatos) {
		new Label(panelPlatos).text = "Platos"

		val table = new Table<Plato>(panelPlatos, typeof(Plato)) => [
			items <=> "pedido.platos"
			value <=> "platoSeleccionado"
		]

		this.describirTablaDePlatos(table)
	}

// ********************************************************
// ** Creacion de la tabla de platos
// ********************************************************
	def describirTablaDePlatos(Table<Plato> table) {

		new Column<Plato>(table) => [
			title = "Pizza"
			fixedSize = 200
			bindContentsToProperty("pizza").transformer = [ Pizza p |
				p.nombre
			]
		]

		new Column<Plato>(table) => [
			title = "Tama�o"
			fixedSize = 200
			bindContentsToProperty("tamanio").transformer = [ Tamanio t |
				t.nombre
			]
		]

		new Column<Plato>(table) => [
			title = "Precio"
			fixedSize = 200
			bindContentsToProperty("monto")
		]
	}

// ********************************************************
// ** Creacion de botones para platos
// ********************************************************
	def crearBotonesParaPlatos(Panel panel) {

		new Button(panel) => [
			caption = "Agregar"
			enabled <=> "pedido.esAbierto"
			onClick [this.crearPlato]
		]

		new Button(panel) => [
			caption = "Editar"
			enabled <=> "hayPlatoSeleccionado"
			enabled <=> "pedido.esAbierto"
			enabled <=> "hayPlatosEnPedido"
			onClick [this.editarPlato]
		]

		new Button(panel) => [
			caption = "Eliminar"
			enabled <=> "hayPlatoSeleccionado"
			enabled <=> "pedido.esAbierto"
			enabled <=> "hayPlatosEnPedido"
			onClick [modelObject.pedido.platos.remove(modelObject.platoSeleccionado)]
		]
	}

// ********************************************************
// ** Creacion del panel de datos
// ********************************************************
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

// ********************************************************
// ** Acciones
// ********************************************************
	def editarPlato() {
		this.openDialog(
			new EditarPlatoWindow(this, new PlatoApplicationModel(modelObject.platoSeleccionado), modelObject))
	}

	def crearPlato() {
		this.openDialog(new CrearPlatoWindow(this, new PlatoApplicationModel(new Plato), modelObject))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[modelObject.actualizar]
		dialog.open
	}

	override executeTask() {
		if (modelObject.pedido.isNew) {
			repoPedidos.create(modelObject.pedido)
		} else {
			repoPedidos.update(modelObject.pedido)
		}
		super.executeTask()
	}

// ********************************************************
// ** Repositorios
// ********************************************************
	def RepoPedidos getRepoPedidos() {
		ApplicationContext.instance.getSingleton(typeof(Pedido))
	}

	def getRepoEstados() {
		var repo = new RepoEstados()
		repo
	}
}

// ********************************************************
// ** Definicion de RepoEstados
// ********************************************************
@Accessors
@Observable
class RepoEstados {

	List<EstadoPedido> estados = #[new Preparando, new ListoParaRetirar, new ListoParaEnviar, new EnViaje,
		new Entregado, new Cancelado]

}
