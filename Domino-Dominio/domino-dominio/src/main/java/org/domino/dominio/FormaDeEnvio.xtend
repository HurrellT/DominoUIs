package org.domino.dominio

interface FormaDeEnvio {
	
	def int recargo()
	
	def EstadoPedido siguienteEstado()
	
	
}