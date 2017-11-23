package org.domino.json

import org.domino.dominio.Ingrediente
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JSONViewerIngrediente {
	
	Integer id
	String nombre
	Integer precio
	String distribucionElegida
	
	new(Ingrediente ingrediente){
		this.id = ingrediente.id
		this.nombre = ingrediente.nombre
		this.precio = ingrediente.precio
		this.distribucionElegida = ingrediente.distribucionElegida.getName
	}
	
}