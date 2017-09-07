package org.domino.dominio

class ListoParaRetirar implements EstadoPedido {
	
	override siguienteEstado(FormaDeEnvio envio) {
		new Entregado
	}
	

}