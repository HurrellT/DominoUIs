package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.List
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.Entity

@Accessors
@TransactionalAndObservable
class Plato extends Entity{

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

	def agregarIngredienteExtra(Ingrediente ingred) {
		this.ingredientes.add(ingred)
	}
	
	def montoTotal() {
		var monto = 0.0
		val custom = 70.0
		if(pizza.ingredientes.isEmpty()){
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
}
