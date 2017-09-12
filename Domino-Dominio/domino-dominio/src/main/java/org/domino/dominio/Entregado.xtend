package org.domino.dominio

class Entregado implements EstadoPedido {
	
	override siguienteEstado(Pedido pedido) {
		
	}
	
	override anteriorEstado(Pedido pedido) {
		if (pedido.envio.esDelivery()) {
			new EnViaje()
		}else{
			new ListoParaRetirar()
		}
	}
	
}