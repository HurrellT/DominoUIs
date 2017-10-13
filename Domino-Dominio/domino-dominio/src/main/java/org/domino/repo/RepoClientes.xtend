package org.domino.repo

import org.uqbar.commons.model.CollectionBasedRepo
import org.domino.dominio.Cliente
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
class RepoClientes extends CollectionBasedRepo<Cliente>{
	
	def void create(String nombreR, String usernameR, String pass, String emailR, String dom){
		this.create(new Cliente(nombreR, usernameR, pass, emailR, dom))
	}
	
	override protected getCriterio(Cliente example) {
		null
	}
	
	override createExample() {
		new Cliente
	}
	
	override getEntityType() {
		typeof(Cliente)
	}
	
	def usuarioConId(Integer id) {
		allInstances.findFirst[c | c.id == id]
	}
	
}