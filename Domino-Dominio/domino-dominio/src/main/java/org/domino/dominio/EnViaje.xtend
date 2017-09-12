package org.domino.dominio

import org.domino.dominio.EstadoPedido

class EnViaje implements EstadoPedido {
	
	override siguienteEstado(Pedido pedido) {
		pedido.cronometro.detener
		new Entregado
	}
	
	override anteriorEstado(Pedido pedido) {
		new ListoParaEnviar
	}
	
}