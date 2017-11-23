package org.domino.json

import org.domino.dominio.Cliente
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JSONViewerUsuario {
	
	Integer id
	String usuario
	String password
	String nombre
	String email
	String direccion
	
	new(Cliente cliente) {
		this.id 		= cliente.id
		this.usuario 	= cliente.nick
		this.password 	= cliente.password
		this.nombre 	= cliente.nombre
		this.email 		= cliente.email
		this.direccion 	= cliente.direccion
	}

}