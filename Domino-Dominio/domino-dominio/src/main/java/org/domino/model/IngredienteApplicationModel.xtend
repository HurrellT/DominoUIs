package org.domino.model

import org.domino.dominio.Ingrediente
import org.domino.dominio.Plato
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable

@Accessors 
@Observable 
class IngredienteApplicationModel{

	Ingrediente ingredienteSeleccionado
	Plato plato
	Ingrediente ingredienteNuevo = new Ingrediente 	
	String distribucionSeleccionada

	new(Plato plato){
		this.plato = plato
	}
	
	@Dependencies("ingredienteSeleccionado")
	def getHayIngredienteSeleccionado(){
		ingredienteSeleccionado !== null
	}
	
	def actualizar() {
		plato.agregarIngredienteExtra(new Ingrediente(ingredienteSeleccionado.nombre, ingredienteSeleccionado.precio,distribucionSeleccionada))
	}
	
}