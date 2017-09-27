package org.domino.ui

import org.domino.dominio.Ingrediente
import org.domino.dominio.Pizza
import org.domino.model.MenuApplicationModel
import org.domino.model.PizzaApplicationModel
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class MostrarMenuWindow extends TransactionalDialog<MenuApplicationModel> {

	new(WindowOwner owner, MenuApplicationModel model) {
		super(owner, model)
	}

// ********************************************************
// ** Creacion de paneles
// ********************************************************
	override protected createFormPanel(Panel mainPanel) {
		title = "Dominos Pizza - Menú"

		new Label(mainPanel).text = "Promos"

		val panelPromos = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]

		val tablePromos = new Table<Pizza>(panelPromos, typeof(Pizza)) => [
			items <=> "promos"
			value <=> "promoSeleccionada"
		]

		this.describirPromos(tablePromos)

		val buttonPanel1 = new Panel(panelPromos) => [
			layout = new VerticalLayout
		]

		this.crearPrimerPanelBotones(buttonPanel1)

		new Label(mainPanel).text = "Ingredientes Disponibles"

		val panelIngredientes = new Panel(mainPanel)
		panelIngredientes.layout = new HorizontalLayout

		val tablaIngredientes = new Table<Ingrediente>(panelIngredientes, typeof(Ingrediente)) => [
			items <=> "ingredientes"
			value <=> "ingredienteSeleccionado"
		]

		this.describirIngredientes(tablaIngredientes)

		val buttonPanel2 = new Panel(panelIngredientes) => [
			layout = new VerticalLayout
		]

		this.crearSegundoPanelBotones(buttonPanel2)
	}

// ********************************************************
// ** Creacion de la tabla de promos
// ********************************************************
	def describirPromos(Table<Pizza> table) {
		new Column(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]
		new Column(table) => [
			title = "Precio"
			fixedSize = 200
			bindContentsToProperty("precioConIngredientes")
		]
	}

// ********************************************************
// ** Creacion de la tabla de ingredientes
// ********************************************************
	def describirIngredientes(Table<Ingrediente> table) {
		new Column(table) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]
		new Column(table) => [
			title = "Precio"
			fixedSize = 200
			bindContentsToProperty("precio")
		]
	}

// ********************************************************
// ** Creacion del primer panel de botones
// ********************************************************
	def crearPrimerPanelBotones(Panel buttonPanel) {
		new Button(buttonPanel) => [
			caption = 'Crear'
			width = 60
			onClick [this.crearEditarPromoWindow(new Pizza())]
		]

		new Button(buttonPanel) => [
			caption = 'Editar'
			width = 60
			enabled <=> "hayPromoSeleccionada"
			onClick [this.crearEditarPromoWindow(modelObject.promoSeleccionada)]
		]

		new Button(buttonPanel) => [
			caption = 'Eliminar'
			width = 60
			enabled <=> "hayPromoSeleccionada"
			onClick [
				modelObject.repoPizzas.delete((modelObject.promoSeleccionada))
				modelObject.actualizar
			]
		]
	}

// ********************************************************
// ** Creacion del segundo panel de botones
// ********************************************************
	def crearSegundoPanelBotones(Panel buttonPanel2) {
		new Button(buttonPanel2) => [
			caption = 'Crear'
			width = 60
			onClick[this.crearEditarIngredienteWindow(new Ingrediente())]
		]

		new Button(buttonPanel2) => [
			caption = 'Editar'
			width = 60
			enabled <=> "hayIngredienteSeleccionado"
			onClick[this.crearEditarIngredienteWindow(modelObject.ingredienteSeleccionado)]
		]

		new Button(buttonPanel2) => [
			caption = 'Eliminar'
			width = 60
			enabled <=> "hayIngredienteSeleccionado"
			onClick [
				modelObject.repoIngredientes.delete((modelObject.ingredienteSeleccionado))
				modelObject.actualizar
			]
		]

		new Button(buttonPanel2) => [
			caption = 'Cerrar'
			alignCenter
			width = 50
			onClick[
				this.accept
				close
			]
		]

	}

// ********************************************************
// ** Acciones
// ********************************************************
	def crearEditarPromoWindow(Pizza pizza) {
		this.openDialog(new EditarPromoWindow(this, new PizzaApplicationModel(pizza)))
	}

	def crearEditarIngredienteWindow(Ingrediente ingrediente) {
		this.openDialog(new EditarIngredienteWindow(this, ingrediente))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[modelObject.actualizar]
		dialog.open
	}
}
