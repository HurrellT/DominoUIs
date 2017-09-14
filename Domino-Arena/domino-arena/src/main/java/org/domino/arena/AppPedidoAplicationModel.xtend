package org.domino.arena

import org.eclipse.xtend.lib.annotations.Accessors
import org.domino.dominio.Pedido
import org.domino.dominio.Plato

@Accessors
class AppPedidoAplicationModel {
	
	Pedido pedido
	
	Plato platoSeleccionado
	
	new(Pedido pedido){
		this.pedido = pedido
	}
}