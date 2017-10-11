package org.domino.dominio

import org.uqbar.commons.model.annotations.Observable

@Observable
class ListoParaEnviar extends EstadoPedido {

	override siguienteEstado(Pedido pedido) {
		pedido.notifyObservers(pedido.cliente.email,"Su pedido esta en viaje")
		new EnViaje
	}

	override anteriorEstado(Pedido pedido) {
		new Preparando
	}

	override esCancelado() {
		false
	}
	
	override esEntregado() {
		false
	}
	
	override esPreparando() {
		false
	}

	override getNombre() {
		"Listo Para Enviar"
	}
	
}

