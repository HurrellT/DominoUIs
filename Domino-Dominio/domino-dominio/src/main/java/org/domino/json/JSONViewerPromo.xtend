package org.domino.json

import java.util.List
import org.domino.dominio.Pizza
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JSONViewerPromo {
	
	Integer id
	String nombre
	Integer precio
	List<JSONViewerIngrediente> ingredientes
	String descripcion
	
	new(Pizza pizza){
		this.id = pizza.id
		this.nombre = pizza.nombre
		this.precio = pizza.precio
		this.ingredientes = newArrayList
		this.descripcion = pizza.descripcion
		pizza.ingredientes.forEach[i| ingredientes.add(new JSONViewerIngrediente(i))]
	}
	
}