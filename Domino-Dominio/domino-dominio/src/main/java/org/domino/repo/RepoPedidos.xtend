package org.domino.repo

import org.domino.dominio.Pedido
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable

@Observable
class RepoPedidos extends CollectionBasedRepo<Pedido> {

	override protected getCriterio(Pedido example) {
		null
	}

	override createExample() {
		new Pedido()
	}

	override getEntityType() {
		typeof(Pedido)
	}
}
