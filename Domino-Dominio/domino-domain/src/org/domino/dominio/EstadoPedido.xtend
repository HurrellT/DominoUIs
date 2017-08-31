package org.domino.dominio

interface EstadoPedido {
	
	def EstadoPedido siguienteEstado(Envio envio)
}