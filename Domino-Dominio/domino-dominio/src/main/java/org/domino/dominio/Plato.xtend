package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.List
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@TransactionalAndObservable
class Plato extends Entity implements ConIngredientes{

	Pizza pizza
	Tamanio tamanio
	List<Ingrediente> ingredientes

	new(Pizza pizza, Tamanio tamanio) {
		this.pizza = pizza
		this.tamanio = tamanio
		this.ingredientes = newArrayList
	}
	
	//Para CrearPlatoWindow
	new() {
		this.pizza = new Pizza
		this.tamanio = new Tamanio("Grande",1)
		this.ingredientes = newArrayList
	}

	override agregarIngrediente(Ingrediente ingred) {
		this.ingredientes.add(ingred)
		this.montoTotal
		ObservableUtils.firePropertyChanged(this,"ingredientes")
		ObservableUtils.firePropertyChanged(pizza,"precio")
	}
	
	def montoTotal() {
		var monto = 0.0
		val custom = 70.0
		if(!pizza.ingredientes.isEmpty()){
			monto = custom * (tamanio.factor)
		}
		else {
			monto = pizza.precio * (tamanio.factor)
		}
		for(Ingrediente ing : ingredientes){
			monto += ing.precio
		}
		monto
	}
	
	def getPizza() {
		if (pizza == null) {
			throw new UserException("Seleccione una Pizza")
		}
		else {
			this.pizza
		}
	}
}
