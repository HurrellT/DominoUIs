package org.domino.dominio

class Preparando implements EstadoPedido {

	override siguienteEstado(Envio envio) {
		if (envio.esDelivery()) {
			new ListoParaEnviar()
		}else{
			new ListoParaRetirar()
		}
	}

}
