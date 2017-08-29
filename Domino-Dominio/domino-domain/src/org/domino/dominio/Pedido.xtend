package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Pedido {
	
	Cliente cliente
	Integer fecha
	String aclaracion
	List<Plato> platos  //Debe existir un objeto Plato?
	EstadoPedido estado
	Envio envio  
	
	new(Cliente cliente, Integer fecha, String aclaracion, Envio envio) {
		this.cliente 	= cliente
		this.fecha		= fecha
		this.aclaracion	= aclaracion
		this.envio		= envio
		this.estado = new Preparando
	}
	
	def siguienteEstado(){
		this.estado = this.envio.siguienteEstado(estado)
	}
}