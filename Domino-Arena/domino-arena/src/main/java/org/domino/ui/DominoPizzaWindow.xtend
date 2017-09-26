package org.domino.ui

import java.time.LocalDateTime
import org.domino.dominio.EstadoPedido
import org.domino.dominio.Pedido
import org.domino.model.DominoApplicationModel
import org.domino.model.MenuApplicationModel
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.model.utils.ObservableUtils

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.domino.model.PedidoApplicationModel

class DominoPizzaWindow extends SimpleWindow<DominoApplicationModel> {

	val elementoSeleccionado = new NotNullObservable("pedidoSeleccionado")

	new(WindowOwner owner) {
		super(owner, new DominoApplicationModel)
		modelObject.actualizar
	}

// ********************************************************
// ** Creacion de paneles
// ********************************************************
	override protected createFormPanel(Panel mainPanel) {

		mainPanel.layout = new HorizontalLayout

		val panel = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]

		title = "Domino Pizza"

		new Label(panel).text = "Pedidos abiertos"

		this.crearTablaPedidosAbiertos(panel)

		val buttonMainPanel = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]

		val buttonPanel1 = new Panel(buttonMainPanel) => [
			layout = new ColumnLayout(2)
		]

		this.crearBotones1(buttonPanel1)

		val buttonPanel2 = new Panel(buttonMainPanel) => [
			layout = new VerticalLayout
		]

		this.crearBotones2(buttonPanel2)

		val bottomButtonPanel = new Panel(panel) => [
			layout = new HorizontalLayout
		]

		this.crearBotonesAbajo(bottomButtonPanel)
	}

// ********************************************************
// ** Creacion de la tabla de pedidos abiertos
// ********************************************************
	def crearTablaPedidosAbiertos(Panel panel) {
		val table = new Table<Pedido>(panel, typeof(Pedido)) => [
			items <=> "pedidosAbiertos"
			value <=> "pedidoSeleccionado"
			
		]
		describirPedidosAbiertos(table)
	}

	def describirPedidosAbiertos(Table<Pedido> table) {
		new Column(table) => [
			title = "Pedido"
			fixedSize = 100
			bindContentsToProperty("numeroDePedido").transformer = [ Integer i |
				"Pedido #" + i
			]
		]

		new Column(table) => [
			title = "Estado"
			fixedSize = 100
			bindContentsToProperty("estado").transformer = [EstadoPedido e|e.nombre]
		]

		new Column(table) => [
			title = "Monto"
			fixedSize = 100
			bindContentsToProperty("montoTotal")
		]

		new Column(table) => [
			title = "Hora"
			fixedSize = 100
			bindContentsToProperty("fecha").transformer = [ LocalDateTime f |
				{
					var horas = f.hour
					var min = f.minute

					var res = horas.toString() + ":" + min.toString()

					res
				}
			]
		]

		// DE PRUEBA
		new Column(table) => [
			title = "Aclaracion"
			fixedSize = 200
			bindContentsToProperty("aclaracion")
		]

	}

// ********************************************************
// ** Creacion del primer panel de botones
// ********************************************************
	def crearBotones1(Panel buttonPanel1) {
		
		
		
		new Button(buttonPanel1) => [
			caption = '<<'
			width = 50
			enabled <=> "puedeTenerEstadoAnterior"
			onClick[modelObject.pedidoSeleccionado.anteriorEstado
				ObservableUtils.firePropertyChanged(this.modelObject,"pedidoSeleccionado.estado",this.modelObject.pedidoSeleccionado.estado)
				modelObject.actualizar
			]
		]

		new Button(buttonPanel1) => [
			caption = '>>'
			width = 50
			bindEnabled(elementoSeleccionado)
			onClick[modelObject.pedidoSeleccionado.siguienteEstado
				ObservableUtils.firePropertyChanged(this.modelObject,"pedidoSeleccionado.estado",this.modelObject.pedidoSeleccionado.estado)
				modelObject.actualizar
			]
		]
	}

// ********************************************************
// ** Creacion del segundo panel de botones
// ********************************************************
	def crearBotones2(Panel buttonPanel2) {
		new Button(buttonPanel2) => [
			caption = 'Cancelar'
			width = 110
			bindEnabled(elementoSeleccionado)
			onClick[
				modelObject.pedidoSeleccionado.cancelar
				modelObject.actualizar
			]
		]

		new Button(buttonPanel2) => [
			caption = 'Editar'
			width = 110
			bindEnabled(elementoSeleccionado)
			onClick [this.crearEditarPedidoWindow]
		]
	}

// ********************************************************
// ** Creacion del panel de abajo
// ********************************************************
	def crearBotonesAbajo(Panel bottomButtonPanel) {
		new Button(bottomButtonPanel) => [
			caption = 'Menu'
			width = 150

			onClick [this.crearMostrarMenuWindow()]
		]
		new Button(bottomButtonPanel) => [
			caption = 'Pedidos cerrados'
			width = 150

			onClick [this.crearPedidosCerradosWindow]
		]

		new Button(bottomButtonPanel) => [
			caption = 'Salir'
			width = 150

			onClick [close]
		]

//		/* TESTER BUTTON */
//		new Button(bottomButtonPanel) => [
//			caption = "MAGIC REFRESH BUTTON X2000"
//			width = 300
//			onClick [modelObject.actualizar]
//		]
	}

// ********************************************************
// ** Acciones
// ********************************************************
	def crearEditarPedidoWindow() {
		this.openDialog(new EditarPedidoWindow(this, new PedidoApplicationModel(modelObject.pedidoSeleccionado)))
	}

	def crearMostrarMenuWindow() {
		this.openDialog(new MostrarMenuWindow(this, new MenuApplicationModel()))
	}

	def crearPedidosCerradosWindow() {
		modelObject.pedidoSeleccionado = null  //Esto es para evitar el bug
		this.openDialog(new PedidosCerradosWindow(this, modelObject))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[modelObject.actualizar]
		dialog.open
	}

// ********************************************************
// ** Otros
// ********************************************************
	override protected addActions(Panel actionsPanel) {
	}

}
