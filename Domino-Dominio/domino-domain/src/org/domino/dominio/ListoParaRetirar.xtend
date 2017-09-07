package org.domino.dominio

class ListoParaRetirar implements EstadoPedido {
	
	override siguienteEstado(FormaDeEnvio envio) {
		new Entregado
	}
	
	override anteriorEstado(FormaDeEnvio envio) {
		new Preparando
	}
	

}