package org.domino.ui

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.domino.dominio.Ingrediente
import org.domino.dominio.Plato
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.List
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.commons.applicationContext.ApplicationContext
import org.domino.model.PlatoApplicationModel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.domino.model.IngredienteApplicationModel
import org.uqbar.arena.widgets.Selector
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.domino.repo.RepoIngredientes
import org.uqbar.arena.widgets.Button

class AgregarIngredienteWindow extends TransactionalDialog<IngredienteApplicationModel> {
	PlatoApplicationModel plato

	new(WindowOwner owner, IngredienteApplicationModel model) {
		super(owner, model)
		this.plato = plato
	}

	override protected createFormPanel(Panel mainPanel) {
		title = "Agregue un Ingrediente"

		val panelIngrediente = new Panel(mainPanel)

		this.crearListaDeIngredientes(panelIngrediente)

		new Selector<String>(panelIngrediente) => [
			allowNull(false)
			enabled <=> "hayIngredienteSeleccionado"
			bindItems(new ObservableProperty(repoDistribuciones, "distribuciones"))
		]
	}

	def getRepoDistribuciones() {
		new RepoDistribuciones
	}

	def crearListaDeIngredientes(Panel panelIngrediente) {
		new Panel(panelIngrediente) => [
			layout = new HorizontalLayout
			new List(it) => [
				bindItems(new ObservableProperty(repoIngredientes, "ingredientes")).adaptWith(typeof(Ingrediente),
					"nombre")
				value <=> "ingredienteSeleccionado"

			]
		]

		this.crearBotones(panelIngrediente)
	}

	def crearBotones(Panel panel) {
		new Button(panel) => [
			caption = "Aceptar"
			onClick [
				this.accept
			//modelObject.plato.agregarIngredienteExtra(modelObject.ingredienteSeleccionado)
			]
		]
		new Button(panel) => [
			caption = "Cancelar"
			onClick [this.cancel]
		]
	}

	def getRepoIngredientes() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente))
	}

	override executeTask() {
		modelObject.actualizar()
		
		super.executeTask()
	}

}

@Accessors
@Observable
class RepoDistribuciones {

	java.util.List<String> distribuciones

	new() {
		this.distribuciones = #["Izquierda", "Derecha", "Toda la pizza"]
	}

}
