package org.domino.dominio

import org.uqbar.commons.model.annotations.Observable

@Observable
class Cancelado implements EstadoPedido {
	
	override siguienteEstado(Pedido pedido) {
		
	}
	
	override anteriorEstado(Pedido pedido) {
		
	}
	

	override esCancelado() {
		true
	}
	
	override esEntregado() {
		false
	}
	override getNombre(){
		"Cancelado"

	}
	
}