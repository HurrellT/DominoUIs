package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Ingrediente extends DominoPizza {

	String nombre
	String distribucion

	new(String nombre) {
		this.nombre = nombre
	}

}
