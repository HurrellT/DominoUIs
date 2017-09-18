package org.domino.dominio

import org.uqbar.commons.model.annotations.Observable

@Observable
class Preparando implements EstadoPedido {

	override siguienteEstado(Pedido pedido) {

		pedido.envio.siguienteEstado

	}

	override anteriorEstado(Pedido pedido) {
	}

	override getNombre() {
		"Preparando"
	}
	
	override esCancelado() {
		false
	}
	
	override esEntregado() {
		false
	}

}
