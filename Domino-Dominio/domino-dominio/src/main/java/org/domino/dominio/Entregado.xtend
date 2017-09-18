package org.domino.dominio

import org.uqbar.commons.model.annotations.Observable

@Observable
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

	override getNombre() {
		"Entregado"
	}

}
