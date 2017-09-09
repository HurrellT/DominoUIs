package org.domino.dominio

class ListoParaEnviar implements EstadoPedido {
	
	override siguienteEstado(Pedido pedido) {
		new EnViaje
	}
	
	override anteriorEstado(Pedido pedido) {
		new Preparando
	}
}