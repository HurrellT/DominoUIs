package org.domino.dominio

import org.uqbar.commons.model.Entity

abstract class EstadoPedido extends Entity {
	
	def EstadoPedido siguienteEstado(Pedido pedido)
	
	def EstadoPedido anteriorEstado(Pedido pedido)
	

	def boolean esCancelado()
	
	def boolean esEntregado()

	def String getNombre()
	
	def boolean esPreparando()

	
}