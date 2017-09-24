package org.domino.runnable

import org.domino.repo.DominoBootstrap
import org.domino.ui.DominoPizzaWindow
import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window

class DominoPizzaApplication extends Application {

	new(DominoBootstrap dominoBootstrap) {
		super(dominoBootstrap)
	}

	static def void main(String[] args) {
		new DominoPizzaApplication(new DominoBootstrap).start()
	}

	override protected Window<?> createMainWindow() {
		return new DominoPizzaWindow(this)

	}

}
