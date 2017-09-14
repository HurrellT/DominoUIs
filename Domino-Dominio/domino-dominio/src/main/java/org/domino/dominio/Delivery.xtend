package org.domino.dominio

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