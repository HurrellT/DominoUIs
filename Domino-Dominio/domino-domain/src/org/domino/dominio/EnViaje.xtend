package org.domino.dominio

import org.domino.dominio.EstadoPedido

class EnViaje implements EstadoPedido {
	
	override siguienteEstado(Envio envio) {
		new Entregado
	}
	
}