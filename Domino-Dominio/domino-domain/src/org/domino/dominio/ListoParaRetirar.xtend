package org.domino.dominio

class ListoParaRetirar implements EstadoPedido {
	
	override siguienteEstado(Pedido pedido) {
		new Entregado
	}
	
	override anteriorEstado(Pedido pedido) {
		new Preparando
	}
	

}