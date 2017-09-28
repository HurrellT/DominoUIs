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
import org.uqbar.arena.windows.Dialog

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.NumericField
import org.domino.model.IngredienteApplicationModel
import org.uqbar.commons.model.utils.ObservableUtils
import org.uqbar.arena.bindings.NotNullObservable

class EditarPromoWindow extends TransactionalDialog<PizzaApplicationModel> {

	new(WindowOwner owner, PizzaApplicationModel model) {
		super(owner, model)
		title = defaultTitle
	}

	def defaultTitle() {
		"Editar Promo"
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
			width = 300
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
			fixedSize = 150
		]

		new Column(table) => [
			title = "Precio"
			bindContentsToProperty("precio")
			fixedSize = 150
		]

		new Column(table) => [
			title = "Distribucion"
			bindContentsToProperty("distribucionElegida")
			fixedSize = 150
		]
	}

// ********************************************************
// ** Creacion panel de botones
// ********************************************************
	def crearPanelBotones(Panel bottomButtonPanel) {
		new Button(bottomButtonPanel) => [
			val hayNombre = new NotNullObservable("pizza.nombre")
			bindEnabled(hayNombre)			
			
			caption = 'Aceptar'
			width = 150

			onClick [this.accept]
			setAsDefault
		]

		new Button(bottomButtonPanel) => [
			caption = 'Cancelar'
			width = 150

			onClick [this.close]
		]

		new Button(bottomButtonPanel) => [
			caption = 'Agregar Ingrediente'
			width = 150
			
			onClick[this.agregarIngrediente]
		]

		new Button(bottomButtonPanel) => [
			caption = 'Eliminar Ingrediente'
			width = 150
			enabled <=> "hayIngredienteSeleccionado"
			
			onClick[modelObject.pizza.eliminarIngrediente(modelObject.ingredienteSeleccionado)]
		]		

	}

// ********************************************************
// ** Acciones
// ********************************************************
	def agregarIngrediente() {
		this.openDialog(new AgregarIngredienteWindow(this, new IngredienteApplicationModel(modelObject.pizza)))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[modelObject.actualizar]
		dialog.open
	}

	override executeTask() {
		if (modelObject.pizza.isNew) {
			repoPizzas.create(modelObject.pizza)
		} else {
			repoPizzas.update(modelObject.pizza)
		}
		modelObject.actualizar
		super.executeTask()
	}

// ********************************************************
// ** Repositorios
// ********************************************************
	def RepoPizzas getRepoPizzas() {
		ApplicationContext.instance.getSingleton(typeof(Pizza))
	}

}
