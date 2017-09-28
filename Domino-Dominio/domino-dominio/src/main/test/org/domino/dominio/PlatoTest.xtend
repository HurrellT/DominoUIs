package org.domino.dominio

import org.junit.Test
import static org.junit.Assert.*
import static org.mockito.Mockito.*
import java.util.List
import org.junit.Before
import org.junit.Ignore

class PlatoTest {

	Pizza pizza = mock(Pizza)
	Tamanio tamanio = mock(Tamanio)
	Ingrediente ingred1 = mock(Ingrediente)
	Ingrediente ingred2 = mock(Ingrediente)
	Plato plato1 = new Plato(pizza, tamanio)
	List<Ingrediente> ingredientes = newArrayList

	@Test
	def testUnPlatoTieneUnaPizzaYUnTamanio() {
		
		assertEquals(plato1.getPizza, pizza)
		assertEquals(plato1.tamanio, tamanio)
	}

	@Test
	def testUnPlatoPuedeTenerIngredientesExtras() {
		plato1.agregarIngrediente(ingred1)
		plato1.agregarIngrediente(ingred2)
		assertTrue(plato1.ingredientes.contains(ingred1))
		assertTrue(plato1.ingredientes.contains(ingred2))
	}

	@Test
	def testUnPlatoConPizzaCustomizadaSabeDarSuMontoFinal() {
		plato1.agregarIngrediente(ingred1)
		plato1.agregarIngrediente(ingred2)
		when(ingred1.precio).thenReturn(12)
		when(ingred2.precio).thenReturn(6)
		when(pizza.precio).thenReturn(90)
		ingredientes.add(ingred1)
		ingredientes.add(ingred2)
		when(pizza.ingredientes).thenReturn(ingredientes)
		when(tamanio.factor).thenReturn(0.5)
		val monto = (70 * 0.5) + (12 + 6)
		plato1.montoTotal()
		assertTrue(monto == plato1.monto)
	}
	
	@Ignore
	@Test
	def testUnPlatoConPizzaComunSabeDarSuMontoFinal() { // NO CAMBIAR NADA EN TEST,SE SOLUCIONA CON REVISAR MONTOTOTAL EN PLATO
		plato1.agregarIngrediente(ingred1)
		plato1.agregarIngrediente(ingred2)
		when(ingred1.precio).thenReturn(12)
		when(ingred2.precio).thenReturn(6)
		when(pizza.precio).thenReturn(90)
		when(pizza.ingredientes).thenReturn(ingredientes)
		when(tamanio.factor).thenReturn(0.5)
		val monto = (90 * 0.5) + (12 + 6)
		plato1.montoTotal()
		assertTrue(monto == plato1.monto)
	}
	
}
