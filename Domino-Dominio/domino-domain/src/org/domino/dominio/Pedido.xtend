package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.stream.Collectors

@Accessors
class Pedido {
	
	Cliente cliente
	Integer fecha
	String aclaracion
	List<Plato> platos  
	EstadoPedido estado
	Envio envio  
	
	new(Cliente cliente, Integer fecha, String aclaracion, Envio envio) {
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
	
	def montoTotal(Menu unMenu) {
		platos.stream.mapToInt[p | p.montoTotal(unMenu)].sum() + this.envio.recargo
		
		
	}
	
}