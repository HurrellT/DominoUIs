package org.domino.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@TransactionalAndObservable
class Pizza extends Entity implements ConIngrediente {
	String nombre
	int precio
	List<Ingrediente> ingredientes
		
	new(String nombre, int precio) {
		this.nombre = nombre
		this.precio = precio
		this.ingredientes = newArrayList
		
	}
	
	new() {
		nombre =""
		precio = 0
		this.ingredientes = newArrayList
	}
	
	override agregarIngrediente(Ingrediente ingred){
		ingredientes.add(ingred)
		ObservableUtils.firePropertyChanged(this, "ingredientes")
	}
	
	def eliminarIngrediente(Ingrediente ingred){
		ingredientes.remove(ingred)
	}
}