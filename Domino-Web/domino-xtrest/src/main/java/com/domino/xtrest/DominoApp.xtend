package com.domino.xtrest

import org.domino.dominio.DominoPizza
import org.domino.dominio.Menu
import org.domino.repo.DominoBootstrap
import org.uqbar.xtrest.api.XTRest

class DominoApp {
	def static void main(String[] args) {
		val menu = new Menu()
		
		val biblioteca = new DominoPizza(menu, null);
		
		val bootstrap = new DominoBootstrap
		bootstrap.run

   		XTRest.startInstance(9000	, new DominoRestAPI(biblioteca))
	}
	
}