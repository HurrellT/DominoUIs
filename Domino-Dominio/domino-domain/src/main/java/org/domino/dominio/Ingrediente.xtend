package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente {

	String nombre
	int precio
	String distribucion

	new(String nombre, int precio, String distribucion) {
		this.nombre = nombre
		this.precio = precio
		this.distribucion = distribucion
	}

}
