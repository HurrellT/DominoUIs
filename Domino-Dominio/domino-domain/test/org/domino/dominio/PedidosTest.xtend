package org.domino.dominio

import org.junit.Test
import static org.junit.Assert.*
import static org.mockito.Mockito.*

class PedidosTest {
	
	Cliente cliente = mock(Cliente)
	// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:ii:ss")
	// String fechaString = "2014-09-15 15:03:23"
	// Date fecha = sdf.parse(fechaString);
	Integer fecha = new Integer(1)
	String aclaracion = "Esto es una aclaracion"
	Envio envio = mock(Envio)
	
	Pedido pedido = new Pedido(cliente, fecha, aclaracion, envio)

	@Test
	def testUnPedidoTieneUnClienteUnaFechaUnaAclaracion() {
		when(cliente.nombre).thenReturn("Juan")
		assertEquals(cliente.nombre, pedido.cliente.nombre)
		assertEquals(fecha, pedido.fecha)
		assertEquals(aclaracion, pedido.aclaracion)
		assertEquals(envio, pedido.envio)
	}
	
	@Test
	def testUnPedidoTieneUnEstadoInicial() {
		assertEquals("Preparando", pedido.estado.nombre)
	}
	
	@Test
	def testUnPedidoPuedeCambiarDeEstado() {
		pedido.siguienteEstado()
		assertEquals("Listo para enviar", pedido.estado.nombre)
	}

	
}