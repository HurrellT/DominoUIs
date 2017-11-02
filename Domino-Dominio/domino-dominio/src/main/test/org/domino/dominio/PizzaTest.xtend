package org.domino.dominio

import org.junit.Test

import static org.junit.Assert.*
import static org.mockito.Mockito.*

class PizzaTest {
	String nombre = 'Clasica'
	Pizza pizzaBase = new Pizza(nombre, 90, "Pizza clasica")

	@Test
	def testUnaPizzaEstaCompuestaPorNombrePrecioEIngredientes() {

		assertEquals(nombre, pizzaBase.nombre)
		assertEquals(90, pizzaBase.precio)
		assertTrue(pizzaBase.ingredientes.isEmpty())
	}

	@Test
	def testAUnaPizzaSeLePuedeAgregarUnIngrediente() {
		val ingrediente = mock(Ingrediente)
		pizzaBase.agregarIngrediente(ingrediente)
		assertTrue(pizzaBase.ingredientes.contains(ingrediente))
	}


}
