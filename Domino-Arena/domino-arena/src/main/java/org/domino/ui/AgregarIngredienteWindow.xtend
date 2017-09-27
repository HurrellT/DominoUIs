package org.domino.ui

import org.domino.dominio.Ingrediente
import org.domino.model.IngredienteApplicationModel
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AgregarIngredienteWindow extends TransactionalDialog<IngredienteApplicationModel> {

	new(WindowOwner owner, IngredienteApplicationModel model) {
		super(owner, model)
	}

// ********************************************************
// ** Creacion de paneles
// ********************************************************
	override protected createFormPanel(Panel mainPanel) {
		title = "Agregue un Ingrediente"

		val panelIngrediente = new Panel(mainPanel)

		this.crearListaDeIngredientes(panelIngrediente)

		val panelDistribuciones = new Panel(mainPanel)

		this.crearListaDeDistribuciones(panelDistribuciones)

		val panelBotones = new Panel(mainPanel)
		panelBotones.layout = new HorizontalLayout

		this.crearBotones(panelBotones)
	}

// ********************************************************
// ** Creacion de la lista de ingredientes
// ********************************************************
	def crearListaDeIngredientes(Panel panelIngrediente) {

		new List(panelIngrediente) => [
			bindItems(new ObservableProperty(repoIngredientes, "ingredientes")).adaptWith(typeof(Ingrediente), "nombre")
			value <=> "ingredienteSeleccionado"
		]

	}

// ********************************************************
// ** Creacion de la lista de distribuciones
// ********************************************************
	def crearListaDeDistribuciones(Panel panel) {
		new Selector<String>(panel) => [
			allowNull(false)
			enabled <=> "hayIngredienteSeleccionado"
			bindItems(new ObservableProperty(repoDistribuciones, "distribuciones"))
			value <=> "distribucionSeleccionada"
		]
	}

// ********************************************************
// ** Creacion de los botones
// ********************************************************
	def crearBotones(Panel panel) {
		new Button(panel) => [
			caption = "Aceptar"
			onClick [
				modelObject.actualizar
				this.accept
			]
		]
		new Button(panel) => [
			caption = "Cancelar"
			onClick [this.cancel]
		]
	}

// ********************************************************
// ** Repositorios
// ********************************************************
	def getRepoIngredientes() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente))
	}

	def getRepoDistribuciones() {
		new RepoDistribuciones
	}
}

// ********************************************************
// ** Definicion de RepoDistribuciones
// ********************************************************
@Accessors
@Observable
class RepoDistribuciones {

	java.util.List<String> distribuciones

	new() {
		this.distribuciones = #["Izquierda", "Derecha", "Toda la pizza"]
	}

}
