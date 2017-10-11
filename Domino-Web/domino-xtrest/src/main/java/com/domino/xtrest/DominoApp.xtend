package com.domino.xtrest

import org.domino.dominio.DominoPizza
import org.uqbar.xtrest.api.XTRest
import org.domino.dominio.Menu
import org.domino.dominio.Pizza
import org.domino.dominio.Ingrediente

class DominoApp {
	def static void main(String[] args) {
		val ingrediente = new Ingrediente('Henry',5,'Toda la Pizza')
		val promo = new Pizza('La pizza', 1200)
		promo.agregarIngrediente(ingrediente)
		val promo2 = new Pizza('La pizza2', 5500)
		val servicio = null
		val menu = new Menu() => [actualizarPromo(promo, 120)
			actualizarPromo(promo2,5000)
			actualizarIngrediente(ingrediente,5410)
		]
		val biblioteca = new DominoPizza(menu, servicio);

   		XTRest.startInstance(9000, new DominoRestAPI(biblioteca))
	}
	
}