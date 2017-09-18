package org.domino.arena

import org.eclipse.xtend.lib.annotations.Accessors
import org.domino.dominio.Pedido
import org.domino.dominio.Plato
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class AppPedidoAplicationModel {
	
	Pedido pedido
	
	Plato platoSeleccionado
	
	new(Pedido pedido){
		this.pedido = pedido
		this.platoSeleccionado = pedido.platos.get(0)
	}
	
	def getFechaTransformada(){
					var mes = pedido.fecha.month
					var dia = pedido.fecha.dayOfMonth
					var anio = pedido.fecha.year
					var res = dia.toString() + "/" + mes.toString() + "/" + anio.toString
					res
	}
	
	def getNombre(){'Pedido #' + pedido.numeroDePedido}
}