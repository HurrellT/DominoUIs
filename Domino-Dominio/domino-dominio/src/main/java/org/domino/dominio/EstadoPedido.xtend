package org.domino.dominio

interface EstadoPedido{
	
	def EstadoPedido siguienteEstado(Pedido pedido)
	
	def EstadoPedido anteriorEstado(Pedido pedido)
	

	def boolean esCancelado()
	
	def boolean esEntregado()

	def String getNombre()

	
}