package org.domino.arena

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.domino.dominio.Pedido
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.domino.model.DominoApplicationModel
import org.domino.dominio.EstadoPedido
import java.time.LocalDateTime
import java.time.temporal.ChronoUnit

class CrearPedidosCerradosWindow extends TransactionalDialog<DominoApplicationModel> {
	
	new(WindowOwner owner, DominoApplicationModel model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {
		title = 'Domino Pizza'
		new Label(mainPanel) => [text = 'Pedidos Cerrados']

		crearTablaPedidosCerrados(mainPanel)

		val buttonPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]

		crearBotones(buttonPanel)

	}

	def crearBotones(Panel panel) {
		new Button(panel) => [caption = 'Ver  ' alignRight]

		new Button(panel) => [
			caption = 'Volver  '
			onClick [close]
			alignRight
		]
	}

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
			bindContentsToProperty('numeroDePedido').transformer = [int n | 'Pedido #' + n]
			fixedSize = 200
		]

		new Column(table) => [
			title = 'Estado'
			bindContentsToProperty("estado").transformer = [EstadoPedido e | e.nombre]
			fixedSize = 200
		]

		new Column(table) => [
			title = 'Fecha'
			bindContentsToProperty('fecha').transformer = [LocalDateTime f |
				val dias =f.dayOfMonth
				val meses =f.monthValue
				val anios =f.year
				val res =dias.toString + "/" + meses.toString + "/" + anios.toString
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

}
