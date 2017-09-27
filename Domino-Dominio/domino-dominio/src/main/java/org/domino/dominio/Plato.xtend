package org.domino.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@TransactionalAndObservable
class Plato extends Entity implements ConIngrediente {

	Pizza pizza
	Tamanio tamanio

	double monto
	
	List<Ingrediente> ingredientes

	new(Pizza pizza, Tamanio tamanio) {
		this.pizza = pizza
		this.tamanio = tamanio
		this.ingredientes = newArrayList
		this.monto = pizza.precio
	}

	// Para CrearPlatoWindow
	new() {
		this.pizza = new Pizza
		this.tamanio = new Tamanio("Grande", 1)
		this.ingredientes = newArrayList
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
	
	override agregarIngrediente(Ingrediente i) {
		ingredientes.add(i)
		ObservableUtils.firePropertyChanged(this, "ingredientes", this.ingredientes)
	}
	
}
