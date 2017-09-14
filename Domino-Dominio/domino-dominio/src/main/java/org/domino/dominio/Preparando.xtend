package org.domino.dominio

class Preparando implements EstadoPedido {

	override siguienteEstado(Pedido pedido) {
		//TODO: REPITE LOGICA CON PREPARANDO
		if (pedido.envio.esDelivery()) {
			new ListoParaEnviar()
		} else {
			new ListoParaRetirar()
		}
	}

	override anteriorEstado(Pedido pedido) {
	}

	override toString() {
		"Preparando"
	}
	
	override esCancelado() {
		false
	}
	
	override esEntregado() {
		false
	}

}
