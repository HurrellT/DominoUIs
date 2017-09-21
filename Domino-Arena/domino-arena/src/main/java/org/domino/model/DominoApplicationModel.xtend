package org.domino.model

import org.domino.dominio.DominoPizza
import org.domino.dominio.Pedido
import org.domino.dominio.Pizza
import org.domino.dominio.Plato
import org.domino.dominio.Ingrediente
import org.domino.dominio.Menu
import org.domino.dominio.ServicioDeNotificacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@Observable
class DominoApplicationModel {
	
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
