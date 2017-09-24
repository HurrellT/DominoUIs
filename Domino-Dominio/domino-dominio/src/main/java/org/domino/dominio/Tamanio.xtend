package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Tamanio {
	
	String nombre
	double factor
	
	new(String nombre, double factor){
		this.nombre = nombre
		this.factor = factor
	}
	
}