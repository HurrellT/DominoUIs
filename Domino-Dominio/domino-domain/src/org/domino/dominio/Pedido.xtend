package org.domino.dominio

import java.util.Date
import java.util.List
import java.util.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pedido extends Observable {
	
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
 	
 		this.addObserver(cliente)
	}
	
	def siguienteEstado(){
		this.estado = this.estado.siguienteEstado(envio)
		if(estado instanceof EnViaje){
			this.notifyObservers
		}
	}
	
	
	override notifyObservers(){
		cliente.update(this, estado.toString)
		ServicioDeNotificacion.
		instance.
		sendMail(cliente.email, "Estamos bien", "Esto es una demo en clase, por favor, funcionar!")
		
	}

	def anteriorEstado() {
		this.estado = this.estado.anteriorEstado(envio)
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