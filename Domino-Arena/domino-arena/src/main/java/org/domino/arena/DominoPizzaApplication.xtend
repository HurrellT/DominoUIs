package org.domino.arena

import org.uqbar.arena.Application
import org.domino.dominio.DominoPizza
import org.domino.dominio.ServicioDeNotificacion
import org.domino.dominio.Menu

class DominoPizzaApplication extends Application {

	def static main(String[] args) {
		new DominoPizzaApplication().start
	}
	
	override protected createMainWindow() {
		new CrearDominoPizzaWindow(this, new DominoPizza(new Menu, new ServicioDeNotificacion("ciu.dominos.pizza@gmail.com", "interfaces2017")))
	}
	
}