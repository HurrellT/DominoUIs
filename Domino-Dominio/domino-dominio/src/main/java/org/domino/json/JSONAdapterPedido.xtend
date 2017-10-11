package org.domino.json

import org.eclipse.xtend.lib.annotations.Accessors
import org.domino.dominio.FormaDeEnvio
import java.util.List
import org.domino.dominio.Pizza
import java.util.stream.Collectors

@Accessors
class JSONAdapterPedido {
	
	List<JSONAdapterPlato> pizzas
	
	Integer id_usuario
	
	String aclaraciones
	
	JSONAdapterEntrega entrega
	
	def getPlatos() {
		pizzas.stream.map[ p | p.crearPlato].collect(Collectors.toList)
	}
	
}