package org.domino.arena

import org.domino.dominio.DominoPizza
import org.domino.dominio.Pedido
import org.domino.dominio.Pizza
import org.domino.dominio.Plato
import org.domino.dominio.Ingrediente
import org.domino.dominio.Menu
import org.domino.dominio.ServicioDeNotificacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class AppDominoAplicationModel {
	
	DominoPizza domino
	Pedido pedidoSeleccionado
	Pizza pizzaSeleccionada
	Plato platoSeleccionado
	Ingrediente ingredienteSeleccionado 
	
	 new() {
		
		domino = new DominoPizza(new Menu, new ServicioDeNotificacion("ciu.dominos.pizza@gmail.com", "interfaces2017"))
	}
}