package org.domino.dominio

import org.uqbar.commons.model.annotations.Observable

@Observable
class Delivery implements FormaDeEnvio {
	
	String direccion
	
	new(String direccion){
		this.direccion = direccion
	}
	
	override recargo() {
		15
	}

	
	override siguienteEstado() {
		new ListoParaEnviar()
	}
	
}