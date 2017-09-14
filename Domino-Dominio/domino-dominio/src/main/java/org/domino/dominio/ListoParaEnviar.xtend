package org.domino.dominio

class ListoParaEnviar implements EstadoPedido {

	override siguienteEstado(Pedido pedido) {
		pedido.notifyObservers(pedido.cliente.email,"Su pedido esta en viaje")
		new EnViaje
	}

	override anteriorEstado(Pedido pedido) {
		new Preparando
	}

	override esCancelado() {
		false
	}
	
	override esEntregado() {
		false
	}
	


	override toString() {
		"Listo Para Enviar"
	}
}

