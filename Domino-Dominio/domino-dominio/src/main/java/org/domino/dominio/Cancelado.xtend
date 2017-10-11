package org.domino.dominio

import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.Entity

@Observable
class Cancelado extends EstadoPedido {
	
	override siguienteEstado(Pedido pedido) {
		
	}
	
	override anteriorEstado(Pedido pedido) {
		
	}
	

	override esCancelado() {
		true
	}
	
	override esEntregado() {
		false
	}
	override getNombre(){
		"Cancelado"

	}
	
	override esPreparando() {
		false
	}
	
}