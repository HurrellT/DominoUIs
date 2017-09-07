package org.domino.dominio

class Entregado implements EstadoPedido {
	
	override siguienteEstado(FormaDeEnvio envio) {
		
	}
	
	override anteriorEstado(FormaDeEnvio envio) {
		if (envio.esDelivery()) {
			new EnViaje()
		}else{
			new ListoParaRetirar()
		}
	}
	
}