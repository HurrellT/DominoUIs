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
		if (!pedidoApplication.pedido.platos.contains(modelObject.plato)) {
			this.pedidoApplication.pedido.agregarPlato(modelObject.plato)
		} else {
			this.pedidoApplication.pedido.platos.remove(modelObject.plato)
			this.pedidoApplication.pedido.platos.add(modelObject.plato)
		}
		
		pedidoApplication.pedido.montoTotal
		super.executeTask()
	}

}
