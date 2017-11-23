package org.domino.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.commons.model.utils.ObservableUtils
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@TransactionalAndObservable
class Plato implements ConIngrediente //TODO :revisar que ande bien en la vista sin el ENTITY
{

	Pizza pizza
	public Tamanio tamanio
	double monto
	List<Ingrediente> ingredientes

	new(Pizza pizza, Tamanio tamanio) {
		this.pizza = pizza
		this.tamanio = tamanio
		this.ingredientes = newArrayList
		this.monto = pizza.precioConIngredientes
	}

	// Para CrearPlatoWindow
	new() {
		this.pizza = new Pizza
		this.ingredientes = newArrayList
	}

	@Dependencies("ingredientes","tamanio","pizza.ingredientes")
	def montoTotal() {
		monto = pizza.precioConIngredientes * (tamanio.factor)
		for (Ingrediente ing : this.ingredientes) {
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
		ObservableUtils.firePropertyChanged(this, "tamanio")
	}

	override agregarIngrediente(Ingrediente ingred) {
		this.ingredientes.add(ingred)
		this.montoTotal
		ObservableUtils.firePropertyChanged(this, "ingredientes")
		ObservableUtils.firePropertyChanged(pizza, "precio")
		ObservableUtils.firePropertyChanged(this, "monto")
	}

	def eliminarIngrediente(Ingrediente ingred) {
		ingredientes.remove(ingred)
		this.monto = monto - ingred.precio
		ObservableUtils.firePropertyChanged(this, "ingredientes")
		ObservableUtils.firePropertyChanged(pizza, "precio")
		ObservableUtils.firePropertyChanged(this, "monto")
	}

}
