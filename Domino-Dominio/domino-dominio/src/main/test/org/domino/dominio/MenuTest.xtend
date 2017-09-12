package org.domino.dominio

import org.junit.Test
import static org.junit.Assert.*
import static org.mockito.Mockito.*

class MenuTest {

	Menu menu = new Menu
	Pizza dummyPizza = mock(Pizza)
	Integer precio = new Integer(15)
	Ingrediente dummyIngrediente = mock(Ingrediente)

	@Test
	def testUnMenuEstaCompuestoPorPromosYIngredientes() {
		assertTrue(menu.promos.isEmpty)
		assertTrue(menu.ingredientesDisponibles.isEmpty)
	}

	@Test
	def testAUnMenuSeLePuedenAgregarPromosEIngredientes() {

		menu.actualizarPromo(dummyPizza, precio)
		menu.agregarIngrediente(dummyIngrediente, precio)

		assertTrue(menu.promos.containsKey(dummyPizza))
		assertTrue(menu.ingredientesDisponibles.containsKey(dummyIngrediente))
	}

	@Test
	def testElMenuSabeDecirQuePrecioTieneCadaIngredienteYCadaPromo() {

		menu.actualizarPromo(dummyPizza, precio)
		menu.agregarIngrediente(dummyIngrediente, precio)

		assertEquals(precio, menu.precioPromo(dummyPizza))
		assertEquals(precio, menu.precioIngrediente(dummyIngrediente))
	}
	
	@Test
	def testSePuedenModificarLosPreciosDeUnMenu(){
		var nuevoPrecio2 = new Integer(13)
		var nuevoPrecio =  new Integer(50)
		
		menu.agregarIngrediente(dummyIngrediente, precio)
		menu.actualizarPromo(dummyPizza,precio)
		
		menu.actualizarPromo(dummyPizza,nuevoPrecio)
		menu.agregarIngrediente(dummyIngrediente, nuevoPrecio2)
		
		assertEquals(nuevoPrecio2, menu.precioIngrediente(dummyIngrediente))
		assertEquals(nuevoPrecio, menu.precioPromo(dummyPizza))
	}
}
