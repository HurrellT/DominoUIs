package org.domino.ui

import org.domino.dominio.Plato
import org.uqbar.arena.windows.WindowOwner
import org.domino.model.PedidoApplicationModel

class CrearPlatoWindow extends EditarPlatoWindow {

	new(WindowOwner owner, PedidoApplicationModel pedido) {
		super(owner, new Plato, pedido)
	}

	override defaultTitle() {
		"Agregar un nuevo Plato"
	}

}
