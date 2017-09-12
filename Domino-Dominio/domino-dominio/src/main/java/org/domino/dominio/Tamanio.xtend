package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Tamanio {
	
	String nombre
	double factor
	
	new(String nombre, double factor){
		this.nombre = nombre
		this.factor = factor
	}
	
}