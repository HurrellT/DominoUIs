package org.domino.arena

import org.uqbar.arena.Application

class DominoPizzaApplication extends Application {


	def static main(String[] args) {
		new DominoPizzaApplication().start
	}
	
	override protected createMainWindow() {
		new CrearDominoPizzaWindow(this, new AppDominoAplicationModel())

	}
	
}