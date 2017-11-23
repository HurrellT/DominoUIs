package org.domino.dominio

import org.uqbar.commons.model.annotations.Observable

@Observable
class EnViaje extends EstadoPedido {
	
	
	override siguienteEstado(Pedido pedido) {
		if(pedido.tiempoDelPedido > 30){
			pedido.notifyObservers(pedido.cliente.email,"Su pedido tardo mas de 30 min :(")
		}
		pedido.tiempoDeCierre = pedido.tiempoDelPedido
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
	
	override getNombre() {
		"En Viaje"
	}

	override esPreparando() {
		false
	}
	
}

