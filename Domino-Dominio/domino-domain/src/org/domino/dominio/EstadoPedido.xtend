package org.domino.dominio

interface EstadoPedido {
	
	def EstadoPedido siguienteEstado(FormaDeEnvio envio)
	
	def EstadoPedido anteriorEstado(FormaDeEnvio envio)
	
}