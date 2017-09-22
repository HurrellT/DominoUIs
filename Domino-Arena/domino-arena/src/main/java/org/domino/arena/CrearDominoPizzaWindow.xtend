package org.domino.arena

import org.domino.dominio.Pedido
import org.eclipse.swt.widgets.DateTime
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

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import java.time.LocalDateTime
import org.uqbar.arena.bindings.ObservableProperty
import org.domino.dominio.EstadoPedido
import org.domino.model.DominoApplicationModel
import org.domino.model.AppPedidoAplicationModel

class CrearDominoPizzaWindow extends SimpleWindow<DominoApplicationModel> {

	new(WindowOwner owner) {
		super(owner, new DominoApplicationModel)
		modelObject.actualizar
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
			items <=> "pedidosAbiertos"
			value <=> "pedidoSeleccionado"
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
			
			enabled <=> "hayPedidoSeleccionado"
			
			onClick [ this.crearEditarPedidoWindow ]
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
			
			onClick [ this.crearEditarPromoWindow ]  //BORRAR
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
		
		/* TESTER BUTTON */
		new Button(bottomButtonPanel) => [
			caption = "MAGIC REFRESH BUTTON X2000"
			width = 300
			
			onClick [ modelObject.actualizar ]
		]
	}
	
	/*
	 * Acciones
	 */
	
//	def crearIngredienteWindow() {
//		this.openDialog(new CrearIngredienteWindow(this, modelObject.menu))
//	}
	
	def crearEditarPedidoWindow() {
		this.openDialog(new EditarPedidoWindow(this, new AppPedidoAplicationModel(modelObject.pedidoSeleccionado)))
	}
	 
	def crearPedidosCerradosWindow() {
		this.openDialog(new CrearPedidosCerradosWindow(this, modelObject))
	}
	
	def crearEditarPromoWindow() {  
		//this.openDialog(new EditarPedidoWindow(this, new AppPedidoAplicationModel(new Pedido())))
	}
	
	def openDialog(Dialog<?> dialog) {
// 		dialog.onAccept[modelObject.actualizar]
 		dialog.open
 	}

	def describirPedidos(Table<Pedido> table) {
		new Column(table) => [
			title = "Pedido"
			fixedSize = 200
			bindContentsToProperty("numeroDePedido").transformer = [ Integer i |
				"Pedido #" + i
			]
		]

		new Column(table) => [
			title = "Estado"
			fixedSize = 200
			bindContentsToProperty("estado").transformer = [EstadoPedido e | e.nombre]
		]

		new Column(table) => [
			title = "Monto"
			fixedSize = 200
			bindContentsToProperty("montoTotal")
		]

		new Column(table) => [
			title = "Hora"
			fixedSize = 200
			bindContentsToProperty("fecha").transformer = [LocalDateTime f |
				{
					var horas = f.hour
					var min = f.minute

					var res = horas.toString() + ":" + min.toString()

					res
				}
			]
		]
		
		//DE PRUEBA
		new Column(table) => [
			title = "Aclaracion"
			fixedSize = 200
			bindContentsToProperty("aclaracion")
		]

	}

	override protected addActions(Panel actionsPanel) {

	}

}