package org.domino.dominio

import java.util.List
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class Pizza {
	String nombre
	int precio
	List<Ingrediente> ingredientes
	
	
	new(String nombre, int precio) {
		this.nombre = nombre
		this.precio = precio
		this.ingredientes = newArrayList
		
	}
	
	def agregar(Ingrediente ingrediente) {
		ingredientes.add(ingrediente)
	}
	
	
}