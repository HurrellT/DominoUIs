package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.List

@Accessors
class Plato {
	
	Pizza pizza
	String tamaño
	List<Ingrediente> ingredientes
	
	new(Pizza pizza, String tamaño) {
		this.pizza 	= pizza
		this.tamaño		= tamaño
		this.ingredientes = newArrayList
	}
	
	def agregarIngredienteExtra(Ingrediente ingred){
		this.ingredientes.add(ingred)
	}
	
	def montoTotal() {
		1
	}
	
}