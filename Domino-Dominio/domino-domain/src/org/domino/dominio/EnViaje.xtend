package org.domino.dominio

import org.domino.dominio.EstadoPedido

class EnViaje implements EstadoPedido {
	
	override siguienteEstado(FormaDeEnvio envio) {
		new Entregado
	}
	
	override anteriorEstado(FormaDeEnvio envio) {
		new ListoParaEnviar
	}
	
}