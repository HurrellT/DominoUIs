package org.domino.json

import java.util.List
import org.domino.dominio.Pedido
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JSONViewerPedido {
	
	Integer id
	String estado
	Integer monto
	List<JSONViewerPlato> platos
	Integer id_usuario
	String aclaraciones
	JSONAdapterEntrega entrega
	
	new(Pedido pedido) {
		this.id = pedido.id
		this.estado = pedido.estado.getNombre.replaceAll("[^A-Za-z]+", "").toLowerCase
		this.monto = pedido.montoTotal
		this.id_usuario = pedido.cliente.id
		this.aclaraciones = pedido.aclaracion
		this.entrega  = new JSONAdapterEntrega(pedido.envio)
		this.platos = newArrayList
		pedido.platos.forEach[p| platos.add(new JSONViewerPlato(p))]
	}
	
}