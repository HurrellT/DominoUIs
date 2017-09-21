package org.domino.repo

import java.time.LocalDateTime
import org.domino.dominio.Cliente
import org.domino.dominio.FormaDeEnvio
import org.domino.dominio.Pedido
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable

@Observable
class RepoPedidos extends CollectionBasedRepo<Pedido> {

	def void create (Cliente cliente1, LocalDateTime fecha1 , String aclaracion1 ,FormaDeEnvio formaEnvio){
		this.create(new Pedido => [
			cliente = cliente1
			fecha = fecha
			aclaracion = aclaracion1
			envio= formaEnvio
		])
	}
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
