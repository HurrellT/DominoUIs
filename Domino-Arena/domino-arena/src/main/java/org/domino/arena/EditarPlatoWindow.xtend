package org.domino.arena

import org.domino.dominio.Plato
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.RadioSelector
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.WindowOwner

class EditarPlatoWindow extends TransactionalDialog<Plato> {

	new(WindowOwner owner, Plato model) {
		super(owner, model)
		title = defaultTitle
	}
	
	def defaultTitle() {
		"Editar Plato"
	}

	override protected createFormPanel(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout

		/*
		 * Panel superior
		 */
		val superiorPanel = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]

		new Label(superiorPanel).text = "Pizza"

		new Selector(superiorPanel) => [
//			items <=> "ingredientesDisponibles"
//			value <=> "ingredienteSeleccionado"
			width = 100
		]

		new Label(superiorPanel).text = "Tamanio"

		new Selector(superiorPanel) => [
			
			width=100
		]

		new Label(mainPanel).text = "Agregados"
		
		/*
		 * Checkbox panel
		 */
		val checkBoxPanel = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]


		val ingredientePanel1 = new Panel(checkBoxPanel).layout = new HorizontalLayout

		new CheckBox(ingredientePanel1) => [
//		 			enabled <=> "asdasd"
//					value <=> "asd"
		]

		new Label(ingredientePanel1).text = "Jamon"

		new RadioSelector(ingredientePanel1) => [
//		 			bindItems(new ObservableProperty(this,"distribuciones"))
//					bindValueToProperty("distribucionElegida")
		]

		val ingredientePanel2 = new Panel(checkBoxPanel).layout = new HorizontalLayout

		new CheckBox(ingredientePanel2) => [
//		 			enabled <=> "asdasd"
//					value <=> "asd"
		]

		new Label(ingredientePanel2).text = "Anana"

		new RadioSelector(ingredientePanel2) => [
//		 			bindItems(new ObservableProperty(this,"distribuciones"))
//					bindValueToProperty("distribucionElegida")
		]

		val ingredientePanel3 = new Panel(checkBoxPanel).layout = new HorizontalLayout

		new CheckBox(ingredientePanel3) => [
//		 			enabled <=> "asdasd"
//					value <=> "asd"
		]

		new Label(ingredientePanel3).text = "Morrones"

		new RadioSelector(ingredientePanel3) => [
//		 			bindItems(new ObservableProperty(this,"distribuciones"))
//					bindValueToProperty("distribucionElegida")
		]

		val ingredientePanel4 = new Panel(checkBoxPanel).layout = new HorizontalLayout

		new CheckBox(ingredientePanel4) => [
//		 			enabled <=> "asdasd"
//					value <=> "asd"
		]

		new Label(ingredientePanel4).text = "Queso"

		new RadioSelector(ingredientePanel4) => [
//		 			bindItems(new ObservableProperty(this,"distribuciones"))
//					bindValueToProperty("distribucionElegida")
		]

		val panelPrecio = new Panel(mainPanel).layout = new HorizontalLayout

		new Label(panelPrecio).text = "Precio" + "modelObject.montoTotal"

		val panelFinal = new Panel(mainPanel).layout = new HorizontalLayout
		
		new Button(panelFinal) => [
			caption = 'Aceptar'
			width = 60
			
			onClick[ this.accept ]
		]
		new Button(panelFinal) => [
			caption = 'Cancelar'
			width = 60
			
			onClick[close]
		]	
		
		}
		
	
}

//ACA FALTA UN REPO, Va a haber que hacer un repo para poder hacer esta ventana
//reutilizable. Ademas para no tocar las cosas del dominio, que es donde estamos
//guardando todo

//		modelObject.pedido.platos.add(new Plato())
