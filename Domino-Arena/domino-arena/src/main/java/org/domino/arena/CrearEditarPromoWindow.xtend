package org.domino.arena

import org.domino.dominio.Ingrediente
import org.domino.dominio.Pizza
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.domino.model.PizzaAppModel
import org.uqbar.commons.applicationContext.ApplicationContext
import org.domino.repo.RepoPizzas

class CrearEditarPromoWindow extends TransactionalDialog<PizzaAppModel> {

	new(WindowOwner owner, PizzaAppModel model) {
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
			value <=> "pizza.nombre"
			width = 200
		]

		/*
		 * Panel para el precio
		 */
		val panelPrecio = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]

		new Label(panelPrecio).text = "Precio"

		new TextBox(panelPrecio) => [
			value <=> "pizza.precio"
			width = 200
		]

		/*
		 * Panel para los ingredientes
		 */
		val panelIngredientes = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]

		val tabla = new Table<Ingrediente>(panelIngredientes, typeof(Ingrediente)) => [
			items <=> "pizza.ingredientes"
			value <=> "ingredienteSeleccionado"
			minWidth = 500
		]

		describirIngredientes(tabla)

		/*
		 * Panel para los botones de abajo
		 */
		val bottomButtonPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]

		new Button(bottomButtonPanel) => [
			caption = 'Aceptar'
			width = 150

			onClick [this.accept]
		]

		new Button(bottomButtonPanel) => [
			caption = 'Cancelar'
			width = 150

			onClick [this.close]
		]
	}
	
	def describirIngredientes(Table<Ingrediente> table) {
		new Column(table) => [
			title = "Nombre"
			bindContentsToProperty("nombre")
			fixedSize = 100
		]
		
		new Column(table) => [
			title = "Precio"
			bindContentsToProperty("precio")
			fixedSize = 100
		]
		
		new Column(table) => [
			title = "Distribucion"
			bindContentsToProperty("distribucionElegida")
			fixedSize = 100
		]
	}
	
		override executeTask() {
		if (modelObject.pizza.isNew) {
			repoPizzas.create(modelObject.pizza)
		} else {
			repoPizzas.update(modelObject.pizza)
		}
		super.executeTask()
	}
	
	def RepoPizzas getRepoPizzas() {
		ApplicationContext.instance.getSingleton(typeof(Pizza))
	}

}