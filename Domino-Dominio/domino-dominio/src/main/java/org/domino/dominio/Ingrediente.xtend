package org.domino.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.List

@Accessors
@Observable
class Ingrediente {

	String nombre
	int precio
	List<String> distribuciones = #["Izquierda","Derecha","Toda"]
	String distribucionElegida

	new(String nombre, int precio, String distribucion) {
		this.nombre = nombre
		this.precio = precio
		for (String s : distribuciones) {
			if (s == distribucion) {
				this.distribucionElegida = distribucion
			}
		}
	}

}
