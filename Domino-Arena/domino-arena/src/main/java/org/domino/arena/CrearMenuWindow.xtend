package org.domino.arena

import org.domino.dominio.Ingrediente
import org.domino.dominio.Menu
import org.domino.dominio.Pizza
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class CrearMenuWindow extends TransactionalDialog<Menu> {

	new(WindowOwner owner, Menu model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {
	title = "Dominos Pizza - Menú"

		/*
		 * Creacion panel horizontal superior 
		 */
		new Label(mainPanel).text = "Promos"

		val panelPromos = new Panel(mainPanel) => [
			layout = new HorizontalLayout
		]
		title = "Dominos Pizza - Menú"

		val tablePromos = new Table<Pizza>(panelPromos, typeof(Pizza)) => [
			items <=> "promos" 
		]
		this.describirPromos(tablePromos)

		val buttonPanel = new Panel(panelPromos) => [
			layout = new VerticalLayout
		]

		new Button(buttonPanel) => [
			caption = 'Crear'
			width = 60
		]

		new Button(buttonPanel) => [
			caption = 'Editar'
			width = 60
		]
		new Button(buttonPanel) => [
			caption = 'Eliminar'
			width = 60
		]
		/*
		 * Creacion panel horizontal inferior
		 */
		new Label(mainPanel).text = "Ingredientes Disponibles"

		val panelIngredientes = new Panel(mainPanel)
		panelIngredientes.layout = new HorizontalLayout

		val tablaIngredientes = new Table<Ingrediente>(panelIngredientes, typeof(Ingrediente)) => [
			items <=> "ingredientesDisponibles"
		]
		this.describirIngredientes(tablaIngredientes)

		val buttonPanel2 = new Panel(panelIngredientes) => [
			layout = new VerticalLayout
		]

		new Button(buttonPanel2) => [
			caption = 'Crear'
			width = 60
			
//			onClick[ this.crearIngredienteWindow()]
		]

		new Button(buttonPanel2) => [
			caption = 'Editar'
			width = 60
		]
		new Button(buttonPanel2) => [
			caption = 'Eliminar'
			width = 60
		]

		new Button(buttonPanel2) => [
			caption = 'Cerrar'
			alignCenter
			width = 50

			onClick[close]
		]

}
	
	def describirPromos(Table<Pizza> table) {
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
}
