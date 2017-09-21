package org.domino.arena

import org.uqbar.arena.Application
import org.domino.repo.DominoBootstrap

class DominoPizzaApplication extends Application {
	
	new(DominoBootstrap dominoBootstrap){
		super(dominoBootstrap)
	}


	def static main(String[] args) {
		new DominoPizzaApplication(new DominoBootstrap).start
	}
	
	override protected createMainWindow() {
		new CrearDominoPizzaWindow(this)

	}
	
	
}