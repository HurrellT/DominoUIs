package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.List

@Accessors
class Plato {

	Pizza pizza
	Tamanio tamanio
	List<Ingrediente> ingredientes

	new(Pizza pizza, Tamanio tamanio) {
		this.pizza = pizza
		this.tamanio = tamanio
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
