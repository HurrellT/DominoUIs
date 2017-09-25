package org.domino.model

import org.domino.dominio.Ingrediente
import org.domino.dominio.Pizza
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.domino.dominio.Plato

@Accessors
@Observable
class PlatoApplicationModel {

	Plato plato
	Pizza pizzaSeleccionada
	Ingrediente ingredienteSeleccionado
	List<Ingrediente> ingredientesDisponibles
	List<Ingrediente> ingredientesDelPlato

	new(Plato plato) {
		this.plato = plato
		ingredientesDelPlato = plato.ingredientes 
	}

	def actualizar() {
		ingredientesDelPlato = plato.ingredientes
	}

}
