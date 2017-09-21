package org.domino.repo

import org.uqbar.commons.model.CollectionBasedRepo
import org.domino.dominio.Pizza

class RepoPizzas extends CollectionBasedRepo<Pizza>{
	
	def void create(String nombreP, int precio){
		this.create(new Pizza(nombreP,precio))
	}
	override protected getCriterio(Pizza example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}