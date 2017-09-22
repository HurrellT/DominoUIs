package org.domino.dominio


import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

import java.util.List
import org.uqbar.commons.applicationContext.ApplicationContext
import org.domino.repo.RepoPizzas

@TransactionalAndObservable
@Accessors
class Menu {
	
	List<Ingrediente> ingredientesDisponibles
	List<Pizza> promos

	new() {
		this.ingredientesDisponibles = newArrayList
	}

	def actualizarPromo(Pizza pizza, Integer nuevoPrecio) {
		if (!promos.contains(pizza)) {
			pizza.precio = nuevoPrecio
			this.promos.add(pizza)
		} else {
			for (Pizza p : promos) {
				if (p.nombre == pizza.nombre) {
					p.precio = nuevoPrecio
				}
			}
		}
	}

	def actualizarIngrediente(Ingrediente ingrediente, Integer precio) {
		if (!ingredientesDisponibles.contains(ingrediente)) {
			this.ingredientesDisponibles.add(ingrediente)
			if (ingrediente.precio != precio) {
				for (Ingrediente i : ingredientesDisponibles) {
					if (i.nombre == ingrediente.nombre) {
						i.precio = precio
					}
				}
			}
		} else {
			for (Ingrediente i : ingredientesDisponibles) {
				if (i.nombre == ingrediente.nombre) {
					i.precio = precio
				}
			}
		}
	}

	def precioPromo(Pizza pizza) {
		for (Pizza p : promos) {
			if (p.nombre == pizza.nombre) {
				return p.precio
			} else {
				throw new RuntimeException("No se encuentra la pizza deseada")
			}
		}

	}

	def precioIngrediente(Ingrediente ingrediente) {
		for (Ingrediente i : ingredientesDisponibles) {
			if (i.nombre == i.nombre) {
				return i.precio
			} else {
				throw new RuntimeException("No se encuentra el ingrediente deseado")
			}
		}
	}

	def eliminarPromoDelMenu(Pizza pizza) {
		promos.remove(pizza)
	}

	def quitarIngredienteDeMenu(Ingrediente ingrediente) {
		ingredientesDisponibles.remove(ingrediente)

	}
	
	def getPromos(){
		val repoPromos = ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizzas
		
		repoPromos.allInstances
	}
}
