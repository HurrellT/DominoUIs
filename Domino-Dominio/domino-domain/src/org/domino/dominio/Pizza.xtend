package org.domino.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pizza extends DominoPizza {
	String nombre
	List<Ingrediente> ingredientes
	
	new(String nombre) {
		this.nombre = nombre
		this.ingredientes = newArrayList
	}
	
	def agregar(Ingrediente ingrediente) {
		ingredientes.add(ingrediente)
	}
	
}