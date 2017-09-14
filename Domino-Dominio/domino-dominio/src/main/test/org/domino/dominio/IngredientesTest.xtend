package org.domino.dominio

import org.junit.Test

import static org.junit.Assert.*

class IngredientesTest {
	
	String nombre = "Aceituna"
	String distribucion = "Toda"
	Ingrediente ingrediente = new Ingrediente(nombre, 17, distribucion)
	
	@Test
	def testUnIngredienteEstaCompuestoPorNombrePrecioYDistribucion(){
		
		assertEquals(nombre, ingrediente.nombre)
		assertEquals(distribucion, ingrediente.distribucionElegida)
		assertEquals(17, ingrediente.precio)
	}
}