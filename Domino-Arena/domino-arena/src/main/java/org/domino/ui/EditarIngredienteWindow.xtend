package org.domino.ui

import org.domino.dominio.Ingrediente
import org.domino.repo.RepoIngredientes
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.applicationContext.ApplicationContext

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.bindings.NotNullObservable

class EditarIngredienteWindow extends TransactionalDialog<Ingrediente> {

	new(WindowOwner owner, Ingrediente model) {
		super(owner, model)
	}

// ********************************************************
// ** Creacion de paneles
// ********************************************************
	override protected createFormPanel(Panel mainPanel) {

		this.title = "Ingrediente"

		mainPanel.layout = new ColumnLayout(2)

		new Label(mainPanel) // Espacio
		new Label(mainPanel).text = "Nombre"

		new TextBox(mainPanel) => [
			value <=> "nombre"
		]

		new Label(mainPanel).text = "Precio"

		new NumericField(mainPanel) => [
			val tieneNombre = new NotNullObservable("nombre")
			bindEnabled(tieneNombre)
			
			value <=> "precio"
		]

		new Button(mainPanel) => [
			val tienePrecio = new NotNullObservable("precio")
			bindEnabled(tienePrecio)
			
			caption = "Aceptar"
			onClick [this.accept]
			setAsDefault
		]

		new Button(mainPanel) => [
			caption = "Cancelar"
			onClick [this.cancel]
		]
	}

// ********************************************************
// ** Acciones
// ********************************************************
	override executeTask() {
		if (modelObject.isNew) {
			repoIngredientes.create(modelObject)
		} else {
			repoIngredientes.update(modelObject)
		}
		super.executeTask()
	}

// ********************************************************
// ** Repositorios
// ********************************************************
	def RepoIngredientes getRepoIngredientes() {
		ApplicationContext.instance.getSingleton(typeof(Ingrediente))
	}

}
