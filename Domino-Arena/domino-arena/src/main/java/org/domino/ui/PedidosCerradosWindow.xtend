package org.domino.ui

import java.time.LocalDateTime
import org.domino.dominio.EstadoPedido
import org.domino.dominio.Pedido
import org.domino.model.DominoApplicationModel
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.lacar.ui.model.bindings.Observable
import org.uqbar.arena.bindings.NotNullObservable
import org.domino.model.PedidoApplicationModel

class PedidosCerradosWindow extends TransactionalDialog<DominoApplicationModel> {

	val pedidoSeleccionado = new NotNullObservable("pedidoSeleccionado")
	
	new(WindowOwner owner, DominoApplicationModel model) {
		super(owner, model)
		modelObject.actualizar
	}

// ********************************************************
// ** Creacion de paneles
// ********************************************************
	override protected createFormPanel(Panel mainPanel) {

		title = 'Domino Pizza'

		new Label(mainPanel) => [text = 'Pedidos Cerrados']

		this.crearTablaPedidosCerrados(mainPanel)

		val buttonPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]

		this.crearBotones(buttonPanel)

	}

// ********************************************************
// ** Creacion de la tabla de pedidos cerrados
// ********************************************************
	def crearTablaPedidosCerrados(Panel panel) {
		val tabla = new Table<Pedido>(panel, typeof(Pedido)) => [
			items <=> 'pedidosCerrados'
			value <=> "pedidoSeleccionado"
		]
		describirPedidosCerrados(tabla)
	}

	def describirPedidosCerrados(Table<Pedido> table) {
		new Column(table) => [
			title = 'Pedido'
			bindContentsToProperty('numeroDePedido').transformer = [int n|'Pedido #' + n]
			fixedSize = 200
		]

		new Column(table) => [
			title = 'Estado'
			bindContentsToProperty("estado").transformer = [EstadoPedido e|e.nombre]
			fixedSize = 200
		]

		new Column(table) => [
			title = 'Fecha'
			bindContentsToProperty('fecha').transformer = [ LocalDateTime f |
				val dias = f.dayOfMonth
				val meses = f.monthValue
				val anios = f.year
				val res = dias.toString + "/" + meses.toString + "/" + anios.toString
				res
			]
			fixedSize = 200
		]

		new Column(table) => [
			title = 'Tiempo de Espera'
			bindContentsToProperty('tiempoDelPedido')
			fixedSize = 200
		]
	}

// ********************************************************
// ** Creacion de los botones
// ********************************************************
	def crearBotones(Panel panel) {
		new Button(panel) => [
			caption = 'Ver  '
			alignRight
			bindEnabled(pedidoSeleccionado)
			onClick [this.crearEditarPedidoWindow]
		]

		new Button(panel) => [
			caption = 'Volver  '
			alignRight
			onClick [close]
		]
	}

// ********************************************************
// ** Acciones
// ********************************************************
	def crearEditarPedidoWindow() {
		this.openDialog(new EditarPedidoWindow(this, new PedidoApplicationModel(modelObject.pedidoSeleccionado)))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.open
	}

}
