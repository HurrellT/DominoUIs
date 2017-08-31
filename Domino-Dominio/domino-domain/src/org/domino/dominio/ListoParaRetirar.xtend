package org.domino.dominio

class ListoParaRetirar implements EstadoPedido {
	
	override siguienteEstado(Envio envio) {
		new Entregado
	}
	
	
	
}