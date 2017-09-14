package org.domino.dominio

class Preparando implements EstadoPedido {

	override siguienteEstado(Pedido pedido) {

		pedido.envio.siguienteEstado

	}

	override anteriorEstado(Pedido pedido) {
	}

	override toString() {
		"Preparando"
	}
	
	override esCancelado() {
		false
	}
	
	override esEntregado() {
		false
	}

}
