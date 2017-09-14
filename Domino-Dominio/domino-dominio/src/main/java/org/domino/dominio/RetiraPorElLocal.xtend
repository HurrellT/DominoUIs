package org.domino.dominio

class RetiraPorElLocal implements FormaDeEnvio {

	override recargo() {
		0
	}
	
	override siguienteEstado() {
		new ListoParaRetirar()
	}

}
