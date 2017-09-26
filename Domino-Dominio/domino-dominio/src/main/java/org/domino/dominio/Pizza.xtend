package org.domino.dominio

import java.util.List
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity

@Accessors
@Observable
class Pizza extends Entity implements ConIngredientes{
	String nombre
	int precio
	List<Ingrediente> ingredientes
	
	
	new(String nombre, int precio) {
		this.nombre = nombre
		this.precio = precio
		this.ingredientes = newArrayList
		
	}
	
	new() {
		this.ingredientes = newArrayList
	}
	
	override agregarIngrediente(Ingrediente ingrediente) {
		ingredientes.add(ingrediente)
	}
	
	
}