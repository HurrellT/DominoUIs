package org.domino.dominio

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
	override toString(){
		"Cancelado"

	}
	
}