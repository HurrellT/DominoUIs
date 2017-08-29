package org.domino.dominio

import org.junit.Test

import static org.junit.Assert.*

class IngredientesTest {
	
	
	String nombre
	Ingrediente ingrediente = new Ingrediente(nombre)
	String distribucion
	
	@Test
	def testUnIngredienteEstaCompuestoPorNombreYDistribucion(){
		
		ingrediente.distribucion = distribucion
		
		assertEquals(nombre, ingrediente.nombre)
		assertEquals(distribucion, ingrediente.distribucion)
	}
}