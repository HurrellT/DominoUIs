package org.domino.json

import java.util.List
import java.util.stream.Collectors
import org.domino.dominio.Pedido
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JSONAdapterPedido {
	
	List<JSONAdapterPlato> pizzas
	
	Integer id_usuario
	
	String aclaraciones
	
	JSONAdapterEntrega entrega
	
	
	new (){
	}
	new(Pedido pedido) {//TODO: eliminar dsps del viewer
		this.id_usuario = pedido.cliente.id
		this.aclaraciones = pedido.aclaracion
		this.entrega  = new JSONAdapterEntrega(pedido.envio)
		this.pizzas = newArrayList
		pedido.platos.forEach[p| pizzas.add(new JSONAdapterPlato(p))]
	}
	
	def getPlatos() {
		pizzas.stream.map[ p | p.crearPlato].collect(Collectors.toList)
	}
	
}