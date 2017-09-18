package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Cliente {
	
	String nombre
	String nick
	String password
	String email
	String direccion
	
	new(String nombre, String nick, String password, String email, String direccion) {
		this.nombre 	= nombre
		this.nick		= nick
		this.password	= password
		this.email		= email
		this.direccion	= direccion
	}
	
}