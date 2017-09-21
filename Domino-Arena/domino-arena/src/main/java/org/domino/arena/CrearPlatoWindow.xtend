package org.domino.arena

import org.uqbar.arena.windows.WindowOwner
import org.domino.dominio.Plato

class CrearPlatoWindow extends EditarPlatoWindow {
	
	new(WindowOwner owner) {
		super(owner, new Plato)
	}
	
	override defaultTitle() {
		"Agregar un nuevo Plato"
	}

}