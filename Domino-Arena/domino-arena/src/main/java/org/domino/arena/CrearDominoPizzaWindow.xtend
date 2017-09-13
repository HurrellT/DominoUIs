package org.domino.arena

import org.domino.dominio.DominoPizza
import org.domino.dominio.Pedido
import org.eclipse.swt.widgets.DateTime
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.windows.Dialog

class CrearDominoPizzaWindow extends SimpleWindow<DominoPizza> {

	new(WindowOwner owner, DominoPizza domPizza) {
		super(owner, domPizza)
	}

	override protected createFormPanel(Panel mainPanel) {

		mainPanel.layout = new HorizontalLayout
		
		/*
		 * Main Panel
		 */
		
		val panel = new Panel(mainPanel) => [ 
			layout = new VerticalLayout
		]
		title = "Domino Pizza"

		new Label(panel).text = "Pedidos abiertos"

		val table = new Table<Pedido>(panel, typeof(Pedido)) => [
			items <=> "historial"
		]
		
		this.describirPedidos(table)

		/*
		 * Panel principal para los botones
		 */
		
		val buttonMainPanel = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]
		
		/*
		 * Paneles de los botones
		 */
		val buttonPanel = new Panel(buttonMainPanel) => [
			layout = new ColumnLayout(2)
		]
		
		new Button(buttonPanel) => [
			caption = '<<'
			width = 50
		]
		
		new Button(buttonPanel) => [
			caption = '>>'
			width = 50
		]
		
		
		val buttonPanel2 = new Panel(buttonMainPanel) => [
			layout = new VerticalLayout 
		]
		
		new Button(buttonPanel2) => [
			caption = 'Cancelar'
			width = 110
		]
		
		new Button(buttonPanel2) => [
			caption = 'Editar'
			width = 110
		]
		
		/*
		 * Panel para los botones de abajo
		 */
		
		val bottomButtonPanel = new Panel(panel) => [
			layout = new HorizontalLayout
		]
		
		new Button(bottomButtonPanel) => [
			caption = 'Menu'
			width = 150
		]
		
		new Button(bottomButtonPanel) => [
			caption = 'Pedidos cerrados'
			width = 150
			
			onClick [ this.crearPedidosCerradosWindow ]
		]
		
		new Button(bottomButtonPanel) => [
			caption = 'Salir'
			width = 150
			
			onClick [close]
		]
		
		new Button(bottomButtonPanel) => [
			caption = "Tester Button"
			width = 150
			
			onClick [ this.crearIngredienteWindow ]
		]
	}
	
	/*
	 * Acciones
	 */
	
	def crearIngredienteWindow() {
		this.openDialog(new CrearIngredienteWindow(this, modelObject))
	}
	 
	def crearPedidosCerradosWindow() {
		this.openDialog(new CrearPedidosCerradosWindow(this, modelObject))
	}
	
	def openDialog(Dialog<?> dialog) {
		dialog.open
	}

	def describirPedidos(Table<Pedido> table) {
		new Column(table) => [
			title = "Pedido"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]

		new Column(table) => [
			title = "Estado"
			fixedSize = 200
			bindContentsToProperty("estado")
		]

		new Column(table) => [
			title = "Monto"
			fixedSize = 200
			bindContentsToProperty("montoTotal")
		]

		new Column(table) => [
			title = "Hora"
			fixedSize = 200
			bindContentsToProperty("fecha").transformer = [DateTime f |
				{
					var horas = f.hours
					var min = f.minutes

					var res = horas.toString() + min.toString()

					res
				}
			]
		]

	}

	override protected addActions(Panel actionsPanel) {

	}

}
