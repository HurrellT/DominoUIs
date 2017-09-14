package org.domino.dominio

import org.domino.dominio.EstadoPedido

class EnViaje implements EstadoPedido {

	override siguienteEstado(Pedido pedido) {
		pedido.cronometro.detener
		new Entregado
	}

	override anteriorEstado(Pedido pedido) {
		new ListoParaEnviar
	}
	
	override esCancelado() {
		false
	}
	
	override esEntregado() {
		false
	}
	
	override toString() {
		"En Viaje"
	}

}

