package org.domino.dominio

import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Observable
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@org.uqbar.commons.model.annotations.Observable
class Pedido extends Observable {
	
	Cliente cliente
	Date fecha
	String aclaracion
	List<Plato> platos  
	EstadoPedido estado
	FormaDeEnvio envio
	Cronometro cronometro
	String nombre

	new(Cliente cliente, Date fecha, String aclaracion, FormaDeEnvio envio) {
		this.cliente 	= cliente
		this.fecha		= fecha
		this.aclaracion	= aclaracion
		this.envio		= envio
		this.estado = new Preparando
		this.platos = newArrayList
		this.cronometro = new Cronometro()
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
	
	def cambio() {
		setChanged
	}
	
	def tiempoDelPedido() {
		this.cronometro.tiempoEnMinutos()
	}
	
	def setNombre(Integer num){
		this.nombre = "Pedido #" + num
	}	
}