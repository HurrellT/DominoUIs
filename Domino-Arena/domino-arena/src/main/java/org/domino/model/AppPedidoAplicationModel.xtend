package org.domino.model

import org.domino.dominio.Pedido
import org.domino.dominio.Plato
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.annotations.Dependencies
import org.domino.dominio.EstadoPedido

@Accessors
@TransactionalAndObservable
class AppPedidoAplicationModel {
	
	Pedido pedido
	Plato platoSeleccionado
	Boolean hayPlatoSeleccionado
	EstadoPedido estadoSeleccionado
	
	new(Pedido pedido){
		this.pedido = pedido
		this.platoSeleccionado = pedido.platos.get(0)
	}
	
	def getFechaTransformada(){
		var mes = pedido.fecha.month
		var dia = pedido.fecha.dayOfMonth
		var anio = pedido.fecha.year
		var res = dia.toString() + "/" + mes.toString() + "/" + anio.toString
		res
	}
	
	def getNombre(){'Pedido #' + pedido.numeroDePedido}
	
	@Dependencies("platoSeleccionado")
	def getHayPlatoSeleccionado() {
		platoSeleccionado !== null
	}
	
	def setEstadoSeleccionado(EstadoPedido estadoNuevo) {
		this.estadoSeleccionado = estadoNuevo
		pedido.estado= estadoNuevo
	}
}
