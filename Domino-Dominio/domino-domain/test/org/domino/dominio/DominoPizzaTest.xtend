package org.domino.dominio

import org.junit.Test
import static org.mockito.Mockito.*
import static org.junit.Assert.*

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
	
	val crono = new Cronometro
	
	Pizza pizza = mock(Pizza)
	Integer precio1 = new Integer(70)
	Integer precio2 = new Integer(120)
	
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
	
		when(pedido1.cronometro).thenReturn(this.crono)
		when(pedido2.cronometro).thenReturn(this.crono)
		when(pedido3.cronometro).thenReturn(this.crono)
		dominoPizza.realizarPedido(pedido1)
		dominoPizza.realizarPedido(pedido2)
		dominoPizza.realizarPedido(pedido3)
		
		assertEquals(3,dominoPizza.historial.size)
		assertTrue(dominoPizza.historial.contains(pedido1))
		assertTrue(dominoPizza.historial.contains(pedido2))
		assertTrue(dominoPizza.historial.contains(pedido3))
	}
	
	@Test
	def test003_UnDominoPizzaTieneUnSoloMenuQueSePuedeActualizar() {
	
		menu.actualizarPromo(pizza, precio1)
		assertEquals(70,dominoPizza.menu.precioPromo(pizza))
		
		menu.actualizarPromo(pizza, precio2)
		assertEquals(120,dominoPizza.menu.precioPromo(pizza))
	}
	
}