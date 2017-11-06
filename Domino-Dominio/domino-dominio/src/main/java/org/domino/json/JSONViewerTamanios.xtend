package org.domino.json

import org.eclipse.xtend.lib.annotations.Accessors
import org.domino.dominio.Tamanio

@Accessors
class JSONViewerTamanios {
	
	String nombre
	double factor
	
	new(Tamanio tamanio){
		this.nombre = tamanio.nombre
		this.factor = tamanio.factor
	
	}
}