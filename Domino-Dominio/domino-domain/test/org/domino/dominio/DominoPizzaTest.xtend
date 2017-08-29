package org.domino.dominio

import org.junit.Test
import static org.mockito.Mockito.*
import static org.junit.Assert.*

class DominoPizzaTest {
	
	DominoPizza dominoPizza = new DominoPizza()
	
	//Clientes
	val cliente1 = mock(Cliente)
	val cliente2 = mock(Cliente)
	val cliente3 = mock(Cliente)
	
	@Test
	def test001_UnDominoPizzaTiene2ClientesConMailsUnicos() {
		when(cliente1.email).thenReturn("pepe999@hotmail.com")
		when(cliente2.email).thenReturn("pepe999@hotmail.com")
		when(cliente3.email).thenReturn("roberto_kpo125@gmail.com")
		
		dominoPizza.agregarCliente(cliente1)
		dominoPizza.agregarCliente(cliente2)
		dominoPizza.agregarCliente(cliente3)
		
		assertEquals(2,dominoPizza.clientes.size)
		assertFalse(dominoPizza.clientes.contains(cliente2))
	}
}