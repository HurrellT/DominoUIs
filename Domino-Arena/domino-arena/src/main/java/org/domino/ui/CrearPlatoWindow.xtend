package org.domino.ui

import org.domino.dominio.Plato
import org.uqbar.arena.windows.WindowOwner

class CrearPlatoWindow extends EditarPlatoWindow {

	new(WindowOwner owner) {
		super(owner, new Plato)
	}

	override defaultTitle() {
		"Agregar un nuevo Plato"
	}

}
