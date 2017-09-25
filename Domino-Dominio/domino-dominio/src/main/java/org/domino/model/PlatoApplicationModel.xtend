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

	Ingrediente ingredienteSeleccionado
	Pizza pizzaSeleccionada
	List<Ingrediente> ingredientesDisponibles
	Plato plato

	List<Ingrediente> ingredientesDelPlato

	new(Plato plato) {
		this.plato = plato
		ingredientesDelPlato = plato.ingredientes 
	}

	def actualizar() {
		ingredientesDelPlato = plato.ingredientes
	}

}
