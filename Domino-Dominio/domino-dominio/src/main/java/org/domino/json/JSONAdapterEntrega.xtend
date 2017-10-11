package org.domino.json

import org.domino.dominio.RetiraPorElLocal
import org.domino.dominio.Delivery
import org.domino.dominio.FormaDeEnvio

class JSONAdapterEntrega {
	String tipo
	
	String direccion
	
	def toInstance() {
		var FormaDeEnvio res
		if(tipo == "retiro"){
			res = new RetiraPorElLocal
		}if(tipo == "envio"){
			res = new Delivery(this.direccion)
		}
		res
	}
	
}