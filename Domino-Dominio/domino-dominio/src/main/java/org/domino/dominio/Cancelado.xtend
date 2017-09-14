package org.domino.dominio

class Cancelado implements EstadoPedido {
	
	override siguienteEstado(Pedido pedido) {
		
	}
	
	override anteriorEstado(Pedido pedido) {
		
	}
	
	override toString(){
		"Cancelado"
	}
	
}