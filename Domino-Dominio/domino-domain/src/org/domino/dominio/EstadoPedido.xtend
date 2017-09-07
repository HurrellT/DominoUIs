package org.domino.dominio

interface EstadoPedido {
	
	def EstadoPedido siguienteEstado(FormaDeEnvio envio)
}