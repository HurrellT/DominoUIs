package org.domino.dominio

import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pedido {
	
	Cliente cliente
	Date fecha
	String aclaracion
	List<Plato> platos  
	EstadoPedido estado
	Envio envio  
	
	new(Cliente cliente, Date fecha, String aclaracion, Envio envio) {
		this.cliente 	= cliente
		this.fecha		= fecha
		this.aclaracion	= aclaracion
		this.envio		= envio
		this.estado = new Preparando
		this.platos = newArrayList
	}
	
	def siguienteEstado(){
		this.estado = this.estado.siguienteEstado(envio)
	}
	
	def agregarPlato(Plato plato) {
		this.platos.add(plato)
	}
	
	def montoTotal() {
		platos.stream.mapToInt[p | p.montoTotal() as int].sum() + this.envio.recargo
		
		
	}
	
}