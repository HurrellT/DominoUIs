package org.domino.dominio

import org.junit.Test

import static org.junit.Assert.*
import static org.mockito.Mockito.*


class PedidosTest {

	Cliente cliente = mock(Cliente)
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date fecha= sdf.parse("2015-05-26");
	String aclaracion = "Esto es una aclaracion"
	Envio envio1 = new RetiraPorElLocal
	Envio envio2 = new Delivery("Calle 777")

	Pedido pedido1 = new Pedido(cliente, fecha, aclaracion, envio1)
	Pedido pedido2 = new Pedido(cliente, fecha, aclaracion, envio2)
	var unMenuMock = mock(Menu)

	@Test
	def testUnPedidoTieneUnClienteUnaFechaUnaAclaracion() {
		when(cliente.nombre).thenReturn("Juan")
		assertEquals(cliente.nombre, pedido1.cliente.nombre)
		assertEquals(fecha, pedido1.fecha)
		assertEquals(aclaracion, pedido1.aclaracion)
	}

	@Test
	def testUnPedidoTieneUnEstadoInicialDePreparado() {
		assertTrue(pedido1.estado instanceof Preparando)
	}

	@Test
	def testUnPedidoPuedeCambiarDeEstadoCuandoSeRetiraPorElLocal() {
		pedido1.siguienteEstado()
		pedido1.siguienteEstado()
		assertTrue(pedido1.estado instanceof Entregado)
	}

	@Test
	def testUnPedidoPuedeCambiarDeEstadoCuandoSePideDelivery() {

		pedido2.siguienteEstado
		pedido2.siguienteEstado
		pedido2.siguienteEstado
		assertTrue(pedido2.estado instanceof Entregado)
	}

	@Test
	def testAUnPedidoSeLePuedeAgregarPlatos() {
		var dummyPlato = mock(Plato)
		pedido1.agregarPlato(dummyPlato)

		assertTrue(pedido1.platos.contains(dummyPlato))
	}

	@Test
	def unPedidoParaRetirarEnElLocalTieneComoMontoFinalLaSumaDelMontoDeSusPlatos() {
		var plato1 = mock(Plato)
		when(plato1.montoTotal(unMenuMock)).thenReturn(10)
		var plato2 = mock(Plato)
		when(plato2.montoTotal(unMenuMock)).thenReturn(25)

		pedido1.agregarPlato(plato1)
		pedido1.agregarPlato(plato2)

		assertEquals(35, pedido1.montoTotal(unMenuMock))
	}

	@Test
	def unPedidoParaDevliveryTieneComoMontoFinalLaSumaDelMontoDeSusPlatosMasUnRecargo() {
		var plato1 = mock(Plato)
		when(plato1.montoTotal(unMenuMock)).thenReturn(10)
		var plato2 = mock(Plato)
		when(plato2.montoTotal(unMenuMock)).thenReturn(25)

		pedido2.agregarPlato(plato1)
		pedido2.agregarPlato(plato2)

		assertEquals(50, pedido2.montoTotal(unMenuMock))
	}

}
