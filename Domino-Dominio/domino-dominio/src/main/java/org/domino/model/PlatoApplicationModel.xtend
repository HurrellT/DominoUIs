package org.domino.model

import org.domino.dominio.Ingrediente
import org.domino.dominio.Pizza
import org.domino.dominio.Plato
import org.domino.dominio.Tamanio
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@TransactionalAndObservable
class PlatoApplicationModel {

	Plato plato
	Pizza pizzaSeleccionada
	Ingrediente ingredienteSeleccionado
	
	Tamanio tamanioSeleccionado

	new(Plato plato) {
		this.plato = plato
		this.tamanioSeleccionado = plato.tamanio
	}

	@Dependencies("pizzaSeleccionada")
	def getHayPizzaSeleccionada() {
		pizzaSeleccionada !== null
	}
	
	@Dependencies("pizzaSeleccionada", "tamanioSeleccionado")
	def getPuedeAceptar(){
		hayPizzaSeleccionada && hayTamanioSeleccionado()
	}
	
	@Dependencies("tamanioSeleccionado")
	protected def boolean hayTamanioSeleccionado() {
		this.tamanioSeleccionado !== null
	}

	@Dependencies("ingredienteSeleccionado")
	def getHayIngredienteSeleccionado() {
		ingredienteSeleccionado !== null

	}
	
	def eliminarIngrediente(Ingrediente ingrediente) {
		plato.pizza.eliminarIngrediente(ingredienteSeleccionado)
		ObservableUtils.firePropertyChanged(plato.pizza, "ingredientes")
	}
	
	def actualizar() {
		ObservableUtils.firePropertyChanged(plato, "monto")
	}
	
	def setTamanioPlato() {
		plato.tamanio = tamanioSeleccionado
		this.actualizar
	}
	
}
