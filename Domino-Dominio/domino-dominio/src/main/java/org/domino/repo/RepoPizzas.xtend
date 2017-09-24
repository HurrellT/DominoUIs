package org.domino.repo

import org.uqbar.commons.model.CollectionBasedRepo
import org.domino.dominio.Pizza
import java.util.List
import org.uqbar.commons.model.annotations.Observable

@Observable
class RepoPizzas extends CollectionBasedRepo<Pizza>{
	
	def void create(String nombreP, int precio){
		this.create(new Pizza(nombreP,precio))
	}
	
	override protected getCriterio(Pizza example) {
		null
	}
	
	override createExample() {
		new Pizza
	}
	
	override getEntityType() {
		typeof(Pizza)
	}
	
	def List<Pizza> getPizzas() {
		allInstances	
	}
	
}