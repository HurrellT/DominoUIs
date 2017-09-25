package org.domino.ui

import org.domino.dominio.Plato
import org.domino.model.PedidoApplicationModel
import org.uqbar.arena.windows.WindowOwner

class CrearPlatoWindow extends EditarPlatoWindow {

	new(WindowOwner owner, PedidoApplicationModel pedido) {
		super(owner, new Plato, pedido)
	}

	override defaultTitle() {
		"Agregar un nuevo Plato"
	}

}
