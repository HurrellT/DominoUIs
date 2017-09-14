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


class CrearPedidosCerradosWindow extends TransactionalDialog<AppDominoAplicationModel> {
	
	new(WindowOwner owner, AppDominoAplicationModel model) {
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
			items <=> 'domino.pedidosCerrados'
			value <=> "pedidoSeleccionado"
		]

		describirPedidosCerrados(tabla)

	}

	def describirPedidosCerrados(Table<Pedido> table) {
		new Column(table) => [
			title = 'Pedido'
			bindContentsToProperty('nombre')
			fixedSize = 200
		]

		new Column(table) => [
			title = 'Estado'
			bindContentsToProperty('estado')
			fixedSize = 200
		]

		new Column(table) => [
			title = 'Fecha'
			bindContentsToProperty('fecha')
			fixedSize = 200
		]

		new Column(table) => [
			title = 'Tiempo de Espera'
			bindContentsToProperty('tiempoDelPedido')
			fixedSize = 200
		]
	}

}
