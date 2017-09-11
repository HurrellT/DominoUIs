package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
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