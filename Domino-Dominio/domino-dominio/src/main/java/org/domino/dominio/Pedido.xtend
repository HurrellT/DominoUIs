package org.domino.dominio

import java.time.LocalDateTime
import java.time.temporal.ChronoUnit
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Pedido extends Entity {
	
	Cliente cliente
	LocalDateTime fecha
	String aclaracion
	List<Plato> platos  
	EstadoPedido estado
	FormaDeEnvio envio
	Integer numeroDePedido
	long tiempoDeCierre
	List<ServicioDeNotificacion> obs = newArrayList

	new(Cliente cliente, String aclaracion, FormaDeEnvio envio) {
		this.cliente 	= cliente
		this.fecha		= LocalDateTime.now
		this.aclaracion	= aclaracion
		this.envio		= envio
		this.estado = new Preparando
		this.platos = newArrayList
	}
	
	new() {
		this.estado = new Preparando
		this.platos = newArrayList
		this.fecha = LocalDateTime.now
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
	@Dependencies("platos")
	def getMontoTotal() {
		platos.stream.mapToInt[p | p.monto as int].sum() + this.envio.recargo
	}
	
	def cancelar() {
		this.estado = new Cancelado
		this.tiempoDeCierre = tiempoDelPedido
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
	
	def esAbierto() {
		!(this.estado.esCancelado || this.estado.esEntregado)
	}

}