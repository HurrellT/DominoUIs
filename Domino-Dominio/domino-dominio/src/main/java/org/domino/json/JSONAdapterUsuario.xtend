package org.domino.json

import org.domino.dominio.Cliente
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.domino.repo.RepoClientes

@Accessors
class JSONAdapterUsuario {
	
	String usuario
	String password
	String nombre
	String email
	String direccion

	def actualizar(Cliente cliente) {
//		switch 0 {
//			case this.usuario 	!== null : cliente.nick 		= this.usuario
//			case this.password 	!== null : cliente.password		= this.password
//			case this.nombre 	!== null : cliente.nombre		= this.nombre
//			case this.email		!== null : cliente.email		= this.email
//			case this.direccion	!== null : cliente.direccion	= this.direccion
//		}

		//TODO: Preguntar una forma linda de hacer esto
		
		if (this.usuario !== null) {
			cliente.nick = this.usuario
		}
		if (this.password !== null) {
			cliente.password = this.password
		}
		if (this.nombre !== null) {
			cliente.nombre = this.nombre
		}
		if (this.email !== null) {
			cliente.email = this.email
		}
		if (this.direccion !== null) {
			cliente.direccion = this.direccion
		}
	}
	
	def toInstance() {
		var usuario = new Cliente(nombre, usuario, password, email, direccion)
		usuario
	}
	
}