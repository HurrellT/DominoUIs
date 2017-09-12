package org.domino.dominio

class ListoParaRetirar implements EstadoPedido {
	
	override siguienteEstado(Pedido pedido) {
		pedido.cronometro.detener
		new Entregado
	}
	
	override anteriorEstado(Pedido pedido) {
		new Preparando
	}
	

}