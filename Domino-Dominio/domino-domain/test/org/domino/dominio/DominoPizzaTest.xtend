package org.domino.dominio

import org.junit.Test
import static org.mockito.Mockito.*
import static org.junit.Assert.*

class DominoPizzaTest {
	
	Menu menu = mock(Menu)
	ServicioDeNotificacion servicio = new ServicioDeNotificacion("ciu.dominos.pizza@gmail.com", "interfaces2017")
	DominoPizza dominoPizza = new DominoPizza(menu, servicio)
	
	val cliente1 = mock(Cliente)
	val cliente2 = mock(Cliente)
	val cliente3 = mock(Cliente)
	
	val pedido1 = mock(Pedido)
	val pedido2 = mock(Pedido)
	val pedido3 = mock(Pedido)
	
	@Test
	def test001_UnDominoPizzaTiene2ClientesConMailsYNicksUnicos() {
	
		when(cliente1.email).thenReturn("pepe999@hotmail.com")
		when(cliente2.email).thenReturn("pepe999@hotmail.com")
		when(cliente3.email).thenReturn("roberto_kpo125@gmail.com")
	
		when(cliente1.nick).thenReturn("Rob")
		when(cliente2.nick).thenReturn("Rob")
		when(cliente3.nick).thenReturn("Pepe")
		
		dominoPizza.agregarCliente(cliente1)
		dominoPizza.agregarCliente(cliente2)
		dominoPizza.agregarCliente(cliente3)
		
		assertEquals(2,dominoPizza.clientes.size)
		assertFalse(dominoPizza.clientes.contains(cliente2))
	}
	
	@Test
	def test002_UnDominoPizzaGuardaUnHistorialDeLosPedidosRealizados() {
	
		dominoPizza.realizarPedido(pedido1)
		dominoPizza.realizarPedido(pedido2)
		dominoPizza.realizarPedido(pedido3)
		
		assertEquals(3,dominoPizza.historial.size)
		assertTrue(dominoPizza.historial.contains(pedido1))
		assertTrue(dominoPizza.historial.contains(pedido2))
		assertTrue(dominoPizza.historial.contains(pedido3))
	}
	
}