package org.domino.repo

import org.domino.dominio.EstadoPedido
import org.uqbar.commons.model.CollectionBasedRepo
import org.domino.dominio.Preparando
import org.uqbar.commons.model.annotations.Observable

@Observable
class RepoEstados extends CollectionBasedRepo<EstadoPedido> { 
	
	override protected getCriterio(EstadoPedido example) {
		null
	}
	
	override createExample() {
		new Preparando
	}
	
	override getEntityType() {
		typeof(EstadoPedido)
	}
	
	def getEstados() {
		allInstances
	}
}