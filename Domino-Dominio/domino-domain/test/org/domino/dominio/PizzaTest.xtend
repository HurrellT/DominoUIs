package org.domino.dominio

import org.junit.Test

import static org.junit.Assert.*
import static org.mockito.Mockito.*

class PizzaTest {
	String nombre = 'Clasica'
	Pizza pizzaBase = new Pizza(nombre)

	//Distribuciones de ingredientes disponibles
	String dist1 = "Toda la pizza"
	String dist2 = "Mitad izquierda"
	String dist3 = "Mitad derecha"

	@Test
	def testUnaPizzaEstaCompuestaPorNombreEIngredientes() {

		assertEquals(nombre, pizzaBase.nombre)
		assertTrue(pizzaBase.ingredientes.isEmpty())
	}

	@Test
	def testAUnaPizzaSeLePuedeAgregarUnIngrediente() {
		val ingrediente = mock(Ingrediente)
		pizzaBase.agregar(ingrediente,dist1)
		assertTrue(pizzaBase.ingredientes.containsKey(ingrediente))
	}
	
	@Test
	def test003_UnaPizzaTieneQuesoDistribuidoEnTodaLaPizza() {
		val ingrediente = mock(Ingrediente)
		pizzaBase.agregar(ingrediente,dist1)
		assertTrue(pizzaBase.ingredientes.get(ingrediente) == dist1)
	}

}
