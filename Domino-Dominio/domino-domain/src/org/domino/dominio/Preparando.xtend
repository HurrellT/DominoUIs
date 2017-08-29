package org.domino.dominio

class Preparando implements EstadoPedido {
	
	override siguienteEstado(Envio envio) {
		envio.estadoSiguienteA(this)
	}
	
}