package org.domino.repo

import java.util.List
import org.domino.dominio.Pizza
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
class RepoPizzas extends CollectionBasedRepo<Pizza>{
	
	def void create(String nombreP, int precio, String descripcion){
		this.create(new Pizza(nombreP,precio, descripcion))
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