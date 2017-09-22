package org.domino.repo

import org.uqbar.commons.model.CollectionBasedRepo
import org.domino.dominio.Ingrediente

class RepoIngredientes extends CollectionBasedRepo<Ingrediente>{
	
	def void create(String nombreI, int precioI, String distribucion){
		this.create(new Ingrediente(nombreI, precioI, distribucion))	
	}
	
	override protected getCriterio(Ingrediente example) {
		null
	}
	
	override createExample() {
		new Ingrediente
	}
	
	override getEntityType() {
		typeof(Ingrediente)
	}
	
}