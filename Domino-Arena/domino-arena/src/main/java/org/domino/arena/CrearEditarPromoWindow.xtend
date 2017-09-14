package org.domino.arena

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.domino.dominio.DominoPizza
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.CheckBox
import org.domino.dominio.Ingrediente
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.RadioSelector
import org.uqbar.arena.bindings.ObservableProperty
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class CrearEditarPromoWindow extends TransactionalDialog<AppDominoAplicationModel> {

	new(WindowOwner owner, AppDominoAplicationModel model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {

		/*
		 * Main Panel
		 */
		title = 'Promo'

		mainPanel.layout = new VerticalLayout

		/*
		 * Panel para el nombre
		 */
		val panelNombre = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]

		new Label(panelNombre).text = "Nombre"

		new TextBox(panelNombre) => [
			value <=> "pizzaSeleccionada.nombre"
			width = 100
		]

		/*
		 * Panel para el precio
		 */
		val panelPrecio = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]

		new Label(panelPrecio).text = "Precio"

		new TextBox(panelPrecio) => [
			value <=> "pizzaSeleccionada.precio"
			width = 100
		]

		/*
		 * Panel para los ingredientes
		 */
		val panelIngredientes = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]

		this.mostrarIngredientes(panelIngredientes, modelObject.domino)

		/*
		 * Panel para los botones de abajo
		 */
		val bottomButtonPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]

		new Button(bottomButtonPanel) => [
			caption = 'Aceptar'
			width = 150

			onClick [this.actualizar]
		]

		new Button(bottomButtonPanel) => [
			caption = 'Cancelar'
			width = 150

			onClick [this.close]
		]
	}

	def actualizar() {
		modelObject.domino.menu.actualizarPromo(modelObject.pizzaSeleccionada, modelObject.pizzaSeleccionada.precio)
		this.close
	}

	def mostrarIngredientes(Panel panel, DominoPizza model) {
		for (Ingrediente ing : model.menu.ingredientesDisponibles.keySet()) {
			modelObject.ingredienteSeleccionado = ing  //BORRAR
			val miniPanel = new Panel(panel) => [
				layout = new HorizontalLayout()
			]

			 //new CheckBox(miniPanel) => [
			 //value <=> "..."
			 //]
			 
			new Label(miniPanel).text = ing.nombre

			new Label(miniPanel).text = "          "

			//new RadioSelector(miniPanel) => [
			//	bindItems(new ObservableProperty(this, "..."))
			//	bindValueToProperty("...")
			//]
		}
	}

}