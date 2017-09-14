package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.annotations.Observable

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
	
	def tieneIngrediente(Ingrediente ingrediente) {  //???
		var res = false  
		for (Ingrediente ing : ingredientes){
			res = res || ((ing.nombre == ingrediente.nombre) && (ing.precio == ingrediente.precio) && (ing.distribucion == ingrediente.distribucion))
		}
		res
	}
	
}