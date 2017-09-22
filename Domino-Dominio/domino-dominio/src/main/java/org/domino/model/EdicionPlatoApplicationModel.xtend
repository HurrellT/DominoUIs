package org.domino.model

import org.domino.dominio.Ingrediente
import org.domino.dominio.Pizza
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class EdicionPlatoApplicationModel {
	
	Ingrediente ingredienteSeleccionado
	Pizza pizzaSeleccionada
	List<Ingrediente> ingredientesDisponibles
	
}
