package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Ingrediente {

	String nombre
	int precio
	String distribucion

	new(String nombre, int precio, String distribucion) {
		this.nombre = nombre
		this.precio = precio
		this.distribucion = distribucion
	}

		
	/*
	 * PropertyAdapter
	 */
	 
	 def getNombreIngrediente() {
	 	this.nombre
	 }
	 
	 def getPrecioIngrediente() {
	 	this.precio
	 }
}
