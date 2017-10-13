package org.domino.dominio

import org.junit.Test

import static org.junit.Assert.*

class MenuTest {

	Menu menu = new Menu
	Pizza pizza = new Pizza("Muzza", 55)
	Ingrediente ingredienteJamon = new Ingrediente("Jamon", 55,Distribucion.IZQUIERDA)

	@Test
	def testUnMenuEstaCompuestoPorPromosYIngredientes() {
		assertTrue(menu.promos.isEmpty)
		assertTrue(menu.ingredientesDisponibles.isEmpty)
	}

	@Test
	def testAUnMenuSeLePuedenAgregarPromosEIngredientes() {

		menu.actualizarPromo(pizza, 25)
		menu.actualizarIngrediente(ingredienteJamon,35)

		assertTrue(menu.promos.contains(pizza))
		assertTrue(menu.ingredientesDisponibles.contains(ingredienteJamon))
	}

	@Test
	def testElMenuSabeDecirQuePrecioTieneCadaIngredienteYCadaPromo() {

		menu.actualizarPromo(pizza, 25)
		menu.actualizarIngrediente(ingredienteJamon, 55)

		assertEquals(25, menu.precioPromo(pizza))
		assertEquals(55, menu.precioIngrediente(ingredienteJamon))
	}
	
	@Test
	def testSePuedenModificarLosPreciosDeUnMenu(){
		var nuevoPrecio =  new Integer(50)
		
		menu.actualizarIngrediente(ingredienteJamon,nuevoPrecio)
		menu.actualizarPromo(pizza,nuevoPrecio)
		
		assertEquals(nuevoPrecio, menu.precioIngrediente(ingredienteJamon))
		assertEquals(nuevoPrecio, menu.precioPromo(pizza))
	}
	
	@Test
	def testUnJamonDelMenuQueCuesta55PasaACostar30() {
		menu.actualizarIngrediente(ingredienteJamon,30)
		
		assertEquals(30,ingredienteJamon.precio)
	}
}
