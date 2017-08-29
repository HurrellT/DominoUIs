package org.domino.dominio

class Delivery implements Envio {
	
	String direccion
	
	new(String direccion){
		this.direccion = direccion
	}
	
	override recargo() {
		15
	}
	
}