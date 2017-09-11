package org.domino.dominio

interface EstadoPedido {
	
	def EstadoPedido siguienteEstado(Pedido pedido)
	
	def EstadoPedido anteriorEstado(Pedido pedido)
	
}