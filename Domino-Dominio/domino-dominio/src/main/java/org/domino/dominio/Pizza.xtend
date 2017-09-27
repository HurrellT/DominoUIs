package org.domino.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Pizza extends Entity {
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
	
	def agregarIngrediente(Ingrediente ingred){
		ingredientes.add(ingred)
	}
	
	def eliminarIngrediente(Ingrediente ingred){
		ingredientes.remove(ingred)
	}
}