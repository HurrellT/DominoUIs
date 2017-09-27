package org.domino.model

import org.domino.dominio.Pizza
import org.domino.dominio.Ingrediente
import org.uqbar.commons.model.utils.ObservableUtils
import org.uqbar.commons.model.annotations.Dependencies
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
class PizzaApplicationModel {
	
	Pizza pizza
	Ingrediente ingredienteSeleccionado
	
	new(Pizza pizza){
		this.pizza = pizza
	}
	
	@Dependencies("ingredienteSeleccionado")
	def getHayIngredienteSeleccionado() {
		ingredienteSeleccionado !== null

	}

	def actualizar() {
		ObservableUtils.firePropertyChanged(pizza, "precio")
		ObservableUtils.firePropertyChanged(pizza, "ingredientes")
		ObservableUtils.firePropertyChanged(pizza, "nombre")
	}
	

}