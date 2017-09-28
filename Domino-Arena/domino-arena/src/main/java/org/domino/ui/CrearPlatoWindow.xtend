package org.domino.ui

import org.domino.model.PedidoApplicationModel
import org.domino.model.PlatoApplicationModel
import org.uqbar.arena.windows.WindowOwner

class CrearPlatoWindow extends EditarPlatoWindow {

	new(WindowOwner owner, PlatoApplicationModel plato, PedidoApplicationModel pedido) {
		super(owner, plato, pedido)
		this.pedidoApplication = pedido
	}

	override defaultTitle() {
		"Agregar un nuevo Plato"
	}

	override executeTask() {
		if (!pedidoApplication.platosAAgregar.contains(modelObject.plato)) {
			this.pedidoApplication.platosAAgregar.add(modelObject.plato)
		} else {
			this.pedidoApplication.platosAAgregar.remove(modelObject.plato)
			this.pedidoApplication.platosAAgregar.add(modelObject.plato)
		}
		pedidoApplication.confirmarAdicionDePlatos
		pedidoApplication.pedido.montoTotal
		super.executeTask()
	}

}
