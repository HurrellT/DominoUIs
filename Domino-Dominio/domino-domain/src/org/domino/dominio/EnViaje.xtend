package org.domino.dominio

import org.domino.dominio.EstadoPedido

class EnViaje implements EstadoPedido {
	
	override siguienteEstado(Pedido pedido) {
		new Entregado
	}
	
	override anteriorEstado(Pedido pedido) {
		new ListoParaEnviar
	}
	
}