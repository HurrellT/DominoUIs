package org.domino.ui

import org.domino.dominio.Ingrediente
import org.domino.dominio.Pizza
import org.domino.model.PizzaApplicationModel
import org.domino.repo.RepoPizzas
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
import org.uqbar.commons.applicationContext.ApplicationContext

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.NumericField

class EditarPromoWindow extends TransactionalDialog<PizzaApplicationModel> {

	new(WindowOwner owner, PizzaApplicationModel model) {
		super(owner, model)
	}

// ********************************************************
// ** Creacion de paneles
// ********************************************************
	override protected createFormPanel(Panel mainPanel) {

		this.title = 'Promo'

		mainPanel.layout = new VerticalLayout

		val panelNombre = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]

		new Label(panelNombre).text = "Nombre"

		new TextBox(panelNombre) => [
			value <=> "pizza.nombre"
			width = 200
		]

		val panelPrecio = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]

		new Label(panelPrecio).text = "Precio"

		new NumericField(panelPrecio) => [
			value <=> "pizza.precio"
			width = 200
		]

		val panelIngredientes = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]

		val tabla = new Table<Ingrediente>(panelIngredientes, typeof(Ingrediente)) => [
			items <=> "pizza.ingredientes"
			value <=> "ingredienteSeleccionado"
			minWidth = 500
		]

		this.describirIngredientes(tabla)

		val bottomButtonPanel = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]

		this.crearPanelBotones(bottomButtonPanel)
	}

// ********************************************************
// ** Creacion tabla de ingredientes
// ********************************************************
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

// ********************************************************
// ** Creacion panel de botones
// ********************************************************
	def crearPanelBotones(Panel bottomButtonPanel) {
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

// ********************************************************
// ** Acciones
// ********************************************************
	override executeTask() {
		if (modelObject.pizza.isNew) {
			repoPizzas.create(modelObject.pizza)
		} else {
			repoPizzas.update(modelObject.pizza)
		}
		super.executeTask()
	}

// ********************************************************
// ** Repositorios
// ********************************************************
	def RepoPizzas getRepoPizzas() {
		ApplicationContext.instance.getSingleton(typeof(Pizza))
	}

}
