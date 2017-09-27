package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity

@Accessors
@Observable
class Tamanio extends Entity{
	
	String nombre
	double factor
	
	new(String nombre, double factor){
		this.nombre = nombre
		this.factor = factor
	}
	
	new() {
		
	}
	
}