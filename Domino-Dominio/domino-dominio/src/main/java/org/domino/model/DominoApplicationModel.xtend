package org.domino.model

import org.domino.dominio.DominoPizza
import org.domino.dominio.Menu
import org.domino.dominio.Pedido
import org.domino.dominio.ServicioDeNotificacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.applicationContext.ApplicationContext
import org.domino.repo.RepoPedidos
import java.util.stream.Collectors

@Accessors
@Observable
class DominoApplicationModel extends ApplicationContext {
	
	DominoPizza domino
	Pedido pedidoSeleccionado
	RepoPedidos pedidos 
//	Boolean hayPedidoSeleccionado
	
	 new() {
		domino = new DominoPizza(new Menu, new ServicioDeNotificacion("ciu.dominos.pizza@gmail.com", "interfaces2017"))
	}
	
	def RepoPedidos getRepoPedidos() {
		pedidos = ApplicationContext.instance.getSingleton(typeof(Pedido))
	}
	
	@Dependencies("pedidoSeleccionado")
	def getHayPedidoSeleccionado() {
		pedidoSeleccionado !== null
	}
	
	/*
	 * Metodos para UI
	 */
	 
	def getPedidosCerrados() {
		historial.stream.filter([p | p.estado.esCancelado || p.estado.esEntregado]).collect(Collectors.toList)
	}
	
	def getHistorial() {
		var repoPedidos = ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedidos
		
	 	repoPedidos.allInstances.stream.filter[p | p.esAbierto].collect(Collectors.toList)
	}

}
