package org.domino.dominio

import java.util.Map
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pizza extends DominoPizza {
	String nombre
	Map<Ingrediente, String> ingredientes
	
	new(String nombre) {
		this.nombre = nombre
		this.ingredientes = newHashMap
	}
	
	def agregar(Ingrediente ingrediente, String distribucion) {
		ingredientes.put(ingrediente, distribucion)
	}
	
}