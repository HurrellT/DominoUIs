package org.domino.ui

import org.domino.dominio.Plato
import org.uqbar.arena.windows.WindowOwner
import org.domino.model.PedidoApplicationModel
import org.domino.model.PlatoApplicationModel

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
			this.pedidoApplication.pedido.platos.remove(modelObject)
			this.pedidoApplication.pedido.platos.add(modelObject.plato)
		}
		pedidoApplication.pedido.montoTotal
		super.executeTask()
	}

}
