package org.domino.model

import java.util.List
import java.util.stream.Collectors
import org.domino.dominio.DominoPizza
import org.domino.dominio.Menu
import org.domino.dominio.Pedido
import org.domino.dominio.ServicioDeNotificacion
import org.domino.repo.RepoPedidos
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class DominoApplicationModel extends ApplicationContext {
	
	DominoPizza domino
	Pedido pedidoSeleccionado
	RepoPedidos pedidos 
	List<Pedido> pedidosAbiertos
	List<Pedido> pedidosCerrados
	
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
		
	def actualizar() {
		var repoPedidos = ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedidos
		
	 	pedidosAbiertos = repoPedidos.allInstances.stream.filter[p | p.esAbierto].collect(Collectors.toList)
	 	pedidosCerrados = repoPedidos.allInstances.stream.filter[p | !p.esAbierto].collect(Collectors.toList)
	}

}
