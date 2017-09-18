package org.domino.dominio

import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.time.LocalDateTime
import java.time.temporal.ChronoUnit

@Accessors
@Observable
class Pedido {
	
	Cliente cliente
	LocalDateTime fecha
	String aclaracion
	List<Plato> platos  
	EstadoPedido estado
	FormaDeEnvio envio
	Integer numeroDePedido
	List<ServicioDeNotificacion> obs = newArrayList

	new(Cliente cliente, LocalDateTime fecha, String aclaracion, FormaDeEnvio envio) {
		this.cliente 	= cliente
		this.fecha		= fecha
		this.aclaracion	= aclaracion
		this.envio		= envio
		this.estado = new Preparando
		this.platos = newArrayList
	}
	
	new() {
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
	
	
	def tiempoDelPedido() {
		val diferenciaDeHoras= ChronoUnit.HOURS.between(fecha, LocalDateTime.now)
		val diferenciaDeMinutos= ChronoUnit.MINUTES.between(fecha, LocalDateTime.now)
		
		diferenciaDeHoras * 60 + diferenciaDeMinutos
	}
	
	
	def addObserver(ServicioDeNotificacion o){
		this.obs.add(o)
	}
	
	def notifyObservers(String mail, String msj) {
		obs.stream.forEach(s | s.sendMail(mail,"DominoPizza informa", msj))
	}
	
}