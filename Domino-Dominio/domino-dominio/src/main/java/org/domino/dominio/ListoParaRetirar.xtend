package org.domino.dominio

import org.uqbar.commons.model.annotations.Observable

@Observable
class ListoParaRetirar implements EstadoPedido {

	override siguienteEstado(Pedido pedido) {
		new Entregado
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
	


	override getNombre() {
		"Listo Para Retirar"
	}

}
