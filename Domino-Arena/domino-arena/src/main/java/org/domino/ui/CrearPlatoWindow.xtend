package org.domino.ui

import org.domino.dominio.Plato
import org.uqbar.arena.windows.WindowOwner
import org.domino.model.PedidoApplicationModel
import org.domino.model.PlatoApplicationModel

class CrearPlatoWindow extends EditarPlatoWindow {

	new(WindowOwner owner, PlatoApplicationModel plato, PedidoApplicationModel pedido) {
		super(owner, plato, pedido)
	}

	override defaultTitle() {
		"Agregar un nuevo Plato"
	}

}
