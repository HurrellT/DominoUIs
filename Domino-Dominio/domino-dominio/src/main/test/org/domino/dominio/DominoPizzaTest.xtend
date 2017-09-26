package org.domino.dominio

import org.junit.Test
import static org.mockito.Mockito.*
import static org.junit.Assert.*
import org.junit.Ignore

class DominoPizzaTest {
	
	Menu menu = new Menu
	ServicioDeNotificacion servicio = mock(ServicioDeNotificacion)
	DominoPizza dominoPizza = new DominoPizza(menu, servicio)
	
	val cliente1 = mock(Cliente)
	val cliente2 = mock(Cliente)
	val cliente3 = mock(Cliente)
	
	val pedido1 = mock(Pedido)
	val pedido2 = mock(Pedido)
	val pedido3 = mock(Pedido)
	
	Pizza pizza = new Pizza("Muzza",70)
	
	@Test(expected = RuntimeException)
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
	
	@Ignore
	@Test
	def test002_UnDominoPizzaGuardaUnHistorialDeLosPedidosRealizados() {
	
		dominoPizza.realizarPedido(pedido1)
		dominoPizza.realizarPedido(pedido2)
		dominoPizza.realizarPedido(pedido3)
		
		assertArrayEquals(newArrayList(pedido1, pedido2, pedido3), dominoPizza.historial)
	}
	
	@Test
	def test003_UnDominoPizzaTieneUnSoloMenuQueSePuedeActualizar() {
		menu.actualizarPromo(pizza, 120)
		assertEquals(120,dominoPizza.menu.precioPromo(pizza))
	}
	
}