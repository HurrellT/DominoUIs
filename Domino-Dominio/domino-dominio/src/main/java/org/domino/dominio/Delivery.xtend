package org.domino.dominio

import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
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
	
	override esDelivery() {
		true
	}
	
	override esRetiro() {
		false
	}
	
}