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

	List<String> distribuciones = #["Izquierda","Derecha","Toda"]
	String distribucionElegida


	new(String nombre, Integer precio, String distribucion) {
		this.nombre = nombre
		this.precio = precio
		for (String s : distribuciones) {
			if (s == distribucion) {
				this.distribucionElegida = distribucion
			}
		}
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
