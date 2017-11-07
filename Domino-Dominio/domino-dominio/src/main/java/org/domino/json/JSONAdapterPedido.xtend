package org.domino.json

import java.util.List
import java.util.stream.Collectors
import org.domino.dominio.Pedido
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JSONAdapterPedido {
	
	List<JSONAdapterPlato> pizzas
	
	String id_usuario
	
	String aclaraciones
	
	JSONAdapterEntrega entrega
	
	def getPlatos() {
		pizzas.stream.map[ p | p.crearPlato].collect(Collectors.toList)
	}
	
}