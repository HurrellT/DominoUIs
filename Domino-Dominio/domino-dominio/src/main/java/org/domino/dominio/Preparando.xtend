package org.domino.dominio

class Preparando implements EstadoPedido {

	override siguienteEstado(Pedido pedido) {
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

}
