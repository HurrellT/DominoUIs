package org.domino.dominio

import org.domino.repo.RepoPedidos
import org.junit.Test
import org.uqbar.commons.applicationContext.ApplicationContext
import static org.junit.Assert.*
import static org.mockito.Mockito.*

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

	Pizza pizza = new Pizza("Muzza", 70, "Pizza clasica de Muzzarela")

	@Test(expected=RuntimeException)
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

		assertEquals(2, dominoPizza.clientes.size)
		assertFalse(dominoPizza.clientes.contains(cliente2))
	}

	@Test
	def test002_UnDominoPizzaGuardaPedidosRealizadosEnUnRepositorioDePedidos() {
		ApplicationContext.instance.configureSingleton(typeof(Pedido), new RepoPedidos)
		val repoPedidos = ApplicationContext.instance.getRepo(typeof(Pedido)) as RepoPedidos

		dominoPizza.realizarPedido(pedido1)
		dominoPizza.realizarPedido(pedido2)
		dominoPizza.realizarPedido(pedido3)

		assertTrue(repoPedidos.allInstances.contains(pedido1))
		assertTrue(repoPedidos.allInstances.contains(pedido2))
		assertTrue(repoPedidos.allInstances.contains(pedido3))
	}

	@Test
	def test003_UnDominoPizzaTieneUnSoloMenuQueSePuedeActualizar() {
		menu.actualizarPromo(pizza, 120)
		menu.actualizarPromo(pizza,160)
		assertEquals(160, dominoPizza.menu.precioPromo(pizza))
	}

}
