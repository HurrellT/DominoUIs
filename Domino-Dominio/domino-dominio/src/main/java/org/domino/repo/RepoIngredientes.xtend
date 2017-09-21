package org.domino.repo

import org.uqbar.commons.model.CollectionBasedRepo
import org.domino.dominio.Ingrediente

class RepoIngredientes extends CollectionBasedRepo<Ingrediente>{
	
	def void create(String nombreI, int precioI, String distribucion){
		this.create(new Ingrediente(nombreI, precioI, distribucion))	
	}
	override protected getCriterio(Ingrediente example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}