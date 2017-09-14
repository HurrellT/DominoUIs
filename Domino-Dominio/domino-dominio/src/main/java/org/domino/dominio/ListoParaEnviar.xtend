package org.domino.dominio

class ListoParaEnviar implements EstadoPedido {

	override siguienteEstado(Pedido pedido) {
		pedido.cambio()
		pedido.notifyObservers()
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

