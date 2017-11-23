package org.domino.json

import org.domino.dominio.EstadoPedido
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JSONViewerEstado {

	String nombre
	
	new(EstadoPedido estado) {
		this.nombre = estado.nombre
	}
}