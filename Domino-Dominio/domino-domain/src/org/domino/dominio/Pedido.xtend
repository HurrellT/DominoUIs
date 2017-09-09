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
	FormaDeEnvio envio
	
	new(Cliente cliente, Date fecha, String aclaracion, FormaDeEnvio envio) {
		this.cliente 	= cliente
		this.fecha		= fecha
		this.aclaracion	= aclaracion
		this.envio		= envio
		this.estado = new Preparando
		this.platos = newArrayList
	}
	
	def siguienteEstado(){
		this.estado = this.estado.siguienteEstado(this)
	}
	

	def anteriorEstado() {
		this.estado = this.estado.anteriorEstado(this)
	}
	
	def agregarPlato(Plato plato) {
		this.platos.add(plato)
	}
	
	def montoTotal() {
		platos.stream.mapToInt[p | p.montoTotal() as int].sum() + this.envio.recargo
	
	}
	
	def cancelar() {
		this.estado = new Cancelado
	}
}