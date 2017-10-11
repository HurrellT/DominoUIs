package org.domino.json

import org.domino.dominio.Plato
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JSONViewerPlato {
	
	Integer id_promo
	Integer id_tamanio
	List<JSONAdapterIngrediente> extras
	
	new(Plato plato) {
		this.id_promo = plato.pizza.id
		this.id_tamanio= plato.tamanio.id
		this.extras = newArrayList
		plato.ingredientes.forEach[i | extras.add(new JSONAdapterIngrediente(i))]
	}
	
}