package org.domino.json

import org.domino.dominio.Entregado
import org.domino.dominio.EstadoPedido
import org.domino.dominio.ListoParaRetirar
import org.domino.dominio.ListoParaEnviar
import org.domino.dominio.EnViaje
import org.domino.dominio.Cancelado
import org.domino.dominio.Preparando
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JSONAdapterEstado {
	String nombre
	
	new(){
		
	}
	
	new(EstadoPedido estadoPedido) {
		nombre = estadoPedido.nombre
	}

	def toInstance() {
		var EstadoPedido res = new Cancelado
		switch this.nombre {
			case nombre.contains("Entregado") : res = new Entregado
			case nombre.contains("Cancelado") : res = new Cancelado
			case nombre.contains("En Viaje") : res =new EnViaje
			case nombre.contains("Preparando") :  res =new Preparando
			case nombre.contains("Listo Para Retirar") : res = new ListoParaRetirar
				
			case nombre.contains("Listo Para Enviar") : res = new ListoParaEnviar
		}
		res
	}

}
