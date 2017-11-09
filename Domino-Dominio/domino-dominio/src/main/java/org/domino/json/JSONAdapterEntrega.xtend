package org.domino.json

import org.domino.dominio.RetiraPorElLocal
import org.domino.dominio.Delivery
import org.domino.dominio.FormaDeEnvio
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JSONAdapterEntrega {
	
	String tipo
	
	String direccion
	
	new(){}
		
	new(FormaDeEnvio envio) {
		if(envio.esDelivery){
			this.tipo = "delivery"
			var envioD=  envio as Delivery
			this.direccion = envioD.direccion
		}
		if(envio.esRetiro){
			this.tipo = "retiro"
		}
	}
	
	def toInstance() {
		var FormaDeEnvio res
		if(tipo == "retiro"){
			res = new RetiraPorElLocal
		}if(tipo == "delivery"){
			res = new Delivery(this.direccion)
		}
		res
	}
	
}