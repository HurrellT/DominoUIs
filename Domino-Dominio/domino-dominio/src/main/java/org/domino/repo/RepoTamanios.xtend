package org.domino.repo

import org.uqbar.commons.model.CollectionBasedRepo
import org.domino.dominio.Tamanio
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
class RepoTamanios extends CollectionBasedRepo<Tamanio> {
	
	override protected getCriterio(Tamanio example) {
		null
	}
	def void create(String nombreT, double factor){
		this.create(new Tamanio(nombreT,factor))
	}
	override createExample() {
		new Tamanio 
	}
	
	override getEntityType() {
		typeof (Tamanio)
	}
	
	def getRepoTamanios(){
		allInstances
	}
}