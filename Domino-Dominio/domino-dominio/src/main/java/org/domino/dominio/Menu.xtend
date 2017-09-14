package org.domino.dominio

import java.util.HashMap
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import java.util.List

@TransactionalAndObservable
@Accessors 
class Menu {
	
	List<Ingrediente> ingredientesDisponibles
	
	List<Pizza> promos
		
	new() {
		this.ingredientesDisponibles = newArrayList
		this.promos                  = newArrayList
	}
	
	def actualizarPromo(Pizza pizza, Integer precio) {
		//this.promos.put(pizza,precio)
	}
	
	def agregarIngrediente(Ingrediente ingrediente, Integer precio) {
		//this.ingredientesDisponibles.put(ingrediente,precio)
	}
	
	def precioPromo(Pizza pizza) {
		//promos.get(pizza)
	}
	
	def precioIngrediente(Ingrediente ingrediente) {
	//	ingredientesDisponibles.get(ingrediente)
	}
	
	def eliminarPromoDelMenu(Pizza pizza){
		promos.remove(pizza)
	}
	
	def quitarIngredienteDeMenu(Ingrediente ingrediente){
		ingredientesDisponibles.remove(ingrediente)
	}
}