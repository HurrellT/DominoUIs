package org.domino.model

import org.domino.dominio.Ingrediente
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.domino.dominio.Plato
import org.domino.dominio.Pizza

@Accessors
@TransactionalAndObservable
class IngredienteApplicationModel {

	Ingrediente ingredienteSeleccionado
	String distribucionSeleccionada

	Plato plato
	Pizza pizzaModel

	new(Plato plato) {
		this.plato = plato
		this.pizzaModel = plato.pizza
	}

	new(Pizza pizza) {
		this.pizzaModel = pizza
	}

	@Dependencies("ingredienteSeleccionado")
	def getHayIngredienteSeleccionado() {
		ingredienteSeleccionado !== null
	}

	def actualizar() {

		pizzaModel.agregarIngrediente(
			new Ingrediente(ingredienteSeleccionado.nombre, ingredienteSeleccionado.precio, distribucionSeleccionada))

		ObservableUtils.firePropertyChanged(pizzaModel, "ingredientes")
	}

}
