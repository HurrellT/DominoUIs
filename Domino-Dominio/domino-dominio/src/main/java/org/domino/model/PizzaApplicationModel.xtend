package org.domino.model

import org.domino.dominio.Pizza
import org.domino.dominio.Ingrediente
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.utils.ObservableUtils
import org.uqbar.commons.model.annotations.Dependencies

@Observable
@Accessors
class PizzaApplicationModel {
	
	Pizza pizza
	Ingrediente ingredienteSeleccionado
	
	new(Pizza pizza){
		this.pizza = pizza
	}
	
	def eliminarIngrediente(Ingrediente ingrediente) {
		pizza.ingredientes.remove(ingrediente)
		ObservableUtils.firePropertyChanged(pizza, "ingredientes")
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