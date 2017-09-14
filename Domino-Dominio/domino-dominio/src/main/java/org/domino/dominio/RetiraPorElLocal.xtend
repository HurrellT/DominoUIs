package org.domino.dominio

class RetiraPorElLocal implements FormaDeEnvio {

	override recargo() {
		0
	}

	override esDelivery() {
		false
	}
	
	override siguienteEstado() {
		new ListoParaRetirar()
	}

}
