package org.domino.dominio

class Preparando implements EstadoPedido {

	override siguienteEstado(FormaDeEnvio envio) {
		if (envio.esDelivery()) {
			new ListoParaEnviar()
		}else{
			new ListoParaRetirar()
		}
	}

}
