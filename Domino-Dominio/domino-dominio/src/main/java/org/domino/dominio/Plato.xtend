package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.List
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@TransactionalAndObservable
class Plato extends Entity {

	Pizza pizza
	Tamanio tamanio

	double monto 

	new(Pizza pizza, Tamanio tamanio) {
		this.pizza = pizza
		this.tamanio = tamanio
		this.monto = pizza.precio
	}

	// Para CrearPlatoWindow
	new() {
		this.pizza = new Pizza
		this.tamanio = new Tamanio("Grande", 1)
	}

	def montoTotal() {
		val custom = 70.0
		if (!pizza.ingredientes.isEmpty()) {
			monto = custom * (tamanio.factor)
		} else {
			monto = pizza.precio * (tamanio.factor)
		}
		for (Ingrediente ing : pizza.ingredientes) {
			monto += ing.precio
		}
	}

	def getPizza() {
		if (pizza == null) {
			throw new UserException("Seleccione una Pizza")
		} else {
			this.pizza
		}
	}

	def setTamanio(Tamanio tamanio) {
		this.tamanio = tamanio
		this.montoTotal
		ObservableUtils.firePropertyChanged(this, "monto")
	}	
}
