package org.domino.dominio

import org.junit.Test
import static org.junit.Assert.*
import static org.mockito.Mockito.*

class MenuTest {

	Menu menu = new Menu
	Promo dummyPromo = mock(Promo)
	Integer precio = new Integer(15)
	Ingrediente dummyIngrediente = mock(Ingrediente)

	@Test
	def testUnMenuEstaCompuestoPorPromosYIngredientes() {
		assertTrue(menu.promos.isEmpty)
		assertTrue(menu.ingredientesDisponibles.isEmpty)
	}

	@Test
	def testAUnMenuSeLePuedenAgregarPromosEIngredientes() {

		menu.agregarPromo(dummyPromo, precio)
		menu.agregarIngrediente(dummyIngrediente, precio)

		assertTrue(menu.promos.containsKey(dummyPromo))
		assertTrue(menu.ingredientesDisponibles.containsKey(dummyIngrediente))
	}

	@Test
	def testElMenuSabeDecirQuePrecioTieneCadaIngredienteYCadaPromo() {

		menu.agregarPromo(dummyPromo, precio)
		menu.agregarIngrediente(dummyIngrediente, precio)

		assertEquals(precio, menu.precioDePromo(dummyPromo))
		assertEquals(precio, menu.precioIngrediente(dummyIngrediente))
	}
	
	@Test
	def testSePuedenModificarLosPreciosDeUnMenu(){
		var nuevoPrecio2 = new Integer(13)
		var nuevoPrecio =  new Integer(50)
		
		menu.agregarIngrediente(dummyIngrediente, precio)
		menu.agregarPromo(dummyPromo,precio)
		
		menu.nuevoPrecioPromo(dummyPromo,nuevoPrecio)
		menu.nuevoPrecioIngrediente(dummyIngrediente, nuevoPrecio2)
		
		assertEquals(nuevoPrecio2, menu.precioIngrediente(dummyIngrediente))
		assertEquals(nuevoPrecio, menu.precioDePromo(dummyPromo))
	}
}
