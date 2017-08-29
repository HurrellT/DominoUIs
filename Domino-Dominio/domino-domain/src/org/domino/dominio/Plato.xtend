package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.List

@Accessors
class Plato {
	
	Pizza pizza
	String tamanio
	List<Ingrediente> ingredientes
	
	new(Pizza pizza, String tamanio) {
		this.pizza 	= pizza
		this.tamanio		= tamanio
		this.ingredientes = newArrayList
	}
	
	def agregarIngredienteExtra(Ingrediente ingred){
		this.ingredientes.add(ingred)
	}
	
	def montoTotal() {
		1
	}
	
}