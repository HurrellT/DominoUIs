package org.domino.model

import org.domino.dominio.Pizza
import org.domino.dominio.Ingrediente
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class PizzaApplicationModel {
	
	Pizza pizza
	Ingrediente ingredienteSeleccionado
	
	new(Pizza pizza){
		this.pizza = pizza
	}
}