package org.domino.dominio

class ListoParaEnviar implements EstadoPedido {
	
	override siguienteEstado(FormaDeEnvio envio) {
		new EnViaje
	}
	
	override anteriorEstado(FormaDeEnvio envio) {
		new Preparando
	}
	

}