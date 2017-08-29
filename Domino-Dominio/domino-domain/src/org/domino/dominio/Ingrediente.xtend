package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente {

	String nombre
	String distribucion

	new(String nombre) {
		this.nombre = nombre
	}

}
