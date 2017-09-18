package org.domino.dominio

import org.uqbar.commons.model.annotations.Observable

@Observable
class RetiraPorElLocal implements FormaDeEnvio {

	override recargo() {
		0
	}
	
	override siguienteEstado() {
		new ListoParaRetirar()
	}

}
