package org.domino.dominio

import org.junit.Test
import static org.junit.Assert.*
import static org.mockito.Mockito.*

class PlatoTest {

	Pizza pizza = mock(Pizza)
	String tamaño = "Grande"
	Ingrediente ingred1 = mock(Ingrediente)
	Ingrediente ingred2 = mock(Ingrediente)
	Plato plato1 = new Plato(pizza, tamaño)
	Menu unMenuMock = mock(Menu)

	@Test
	def testUnPlatoTieneUnaPizzaYUnTamaño() {
		when(pizza.nombre).thenReturn("Napolitana")
		assertEquals("Napolitana", plato1.pizza.nombre)
		assertEquals("Grande", plato1.tamanio)
	}

	@Test
	def testUnPlatoPuedeTenerIngredientesExtras() {
		plato1.agregarIngredienteExtra(ingred1)
		plato1.agregarIngredienteExtra(ingred2)
		assertEquals(2, plato1.ingredientes.size)
		assertTrue(plato1.ingredientes.contains(ingred1))
		assertTrue(plato1.ingredientes.contains(ingred2))

	}

	@Test
	def testUnPlatoConUnaPizzaCustomizadaSabeDarSuMontoFinal() {
		when(unMenuMock.precioPromo(pizza)).thenReturn(120)
		when(unMenuMock.precioIngrediente(ingred1)).thenReturn(20)
		when(unMenuMock.precioIngrediente(ingred2)).thenReturn(10)
		plato1.agregarIngredienteExtra(ingred1)
		plato1.agregarIngredienteExtra(ingred2)
		assertEquals(2, plato1.ingredientes.size)
		assertEquals(100, plato1.montoTotal(unMenuMock))
	}
	@Test
	def testUnPlatoConUnaPromoNoCustomizadaSabeDarSuMontoFinal() {
		when(unMenuMock.precioPromo(pizza)).thenReturn(120)
		assertEquals(0, plato1.ingredientes.size)
		assertEquals(120, plato1.montoTotal(unMenuMock)
		)
	}
}
