package org.domino.repo

import org.uqbar.commons.model.CollectionBasedRepo
import org.domino.dominio.Plato
import org.domino.dominio.Pizza
import org.domino.dominio.Tamanio

class RepoPlatos extends CollectionBasedRepo<Plato> {
	
	def void create(Pizza pizza, Tamanio tamanio){
		this.create(new Plato(pizza,tamanio))
	}
	override protected getCriterio(Plato example) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override createExample() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override getEntityType() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}