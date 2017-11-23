package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.List
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@Observable
class Ingrediente extends Entity {

	String nombre
	Integer precio

	Distribucion distribucionElegida


	new(String nombre, Integer precio, Distribucion distribucion) {
		this.nombre = nombre
		this.precio = precio
		this.distribucionElegida = distribucion
	}
	
	new() {
		
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
