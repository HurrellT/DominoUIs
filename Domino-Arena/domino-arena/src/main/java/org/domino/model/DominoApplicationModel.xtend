package org.domino.model

import org.domino.dominio.DominoPizza
import org.domino.dominio.Menu
import org.domino.dominio.Pedido
import org.domino.dominio.ServicioDeNotificacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.applicationContext.ApplicationContext

@Accessors
@Observable
class DominoApplicationModel extends ApplicationContext{
	
	DominoPizza domino
	Pedido pedidoSeleccionado
	Boolean hayPedidoSeleccionado
	
	 new() {
		
		domino = new DominoPizza(new Menu, new ServicioDeNotificacion("ciu.dominos.pizza@gmail.com", "interfaces2017"))
	}
	
	@Dependencies("pedidoSeleccionado")
	def getHayPedidoSeleccionado() {
		pedidoSeleccionado !== null
	}
}
