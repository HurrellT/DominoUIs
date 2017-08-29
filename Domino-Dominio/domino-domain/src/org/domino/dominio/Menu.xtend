package org.domino.dominio

import java.util.HashMap
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Menu {
	
	HashMap<Ingrediente,Integer> ingredientesDisponibles
	
	HashMap<Promo,Integer> promos
		
	new() {
		this.ingredientesDisponibles = newHashMap
		this.promos                  = newHashMap
	}
	
	def agregarPromo(Promo promo, Integer precio) {
		this.promos.put(promo,precio)
	}
	
	def agregarIngrediente(Ingrediente ingrediente, Integer precio) {
		this.ingredientesDisponibles.put(ingrediente,precio)
	}
	
	def precioDePromo(Promo promo) {
		promos.get(promo)
	}
	
	def precioIngrediente(Ingrediente ingrediente) {
		ingredientesDisponibles.get(ingrediente)
	}
	
	def nuevoPrecioPromo(Promo promo, Integer precio) {
		promos.put(promo,precio)
	}
	
	def nuevoPrecioIngrediente(Ingrediente ingrediente, Integer precio) {
		ingredientesDisponibles.put(ingrediente, precio)
	}
	
}