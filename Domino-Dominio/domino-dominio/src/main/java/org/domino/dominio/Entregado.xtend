package org.domino.dominio

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity

@Observable
class Entregado extends EstadoPedido {

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

	override esPreparando() {
		false
	}

}
