package org.domino.dominio

class Entregado implements EstadoPedido {

	override siguienteEstado(Pedido pedido) {
	}

	override anteriorEstado(Pedido pedido) {
	}

	override esCancelado() {
		false
	}

	override esEntregado() {
		true
	}

	override toString() {
		"Entregado"
	}

}
