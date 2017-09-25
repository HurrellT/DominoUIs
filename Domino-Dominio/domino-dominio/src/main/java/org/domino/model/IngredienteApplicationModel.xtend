package org.domino.model

import org.uqbar.commons.applicationContext.ApplicationContext
import org.domino.dominio.Ingrediente
import org.domino.dominio.Plato
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies

@Accessors 
@Observable 
class IngredienteApplicationModel extends ApplicationContext {

	Ingrediente ingredienteSeleccionado
	Plato plato
	Ingrediente ingredienteNuevo = new Ingrediente 	

	new(Plato plato){
		this.plato = plato
	}
	
	@Dependencies("ingredienteSeleccionado")
	def getHayIngredienteSeleccionado(){
		ingredienteSeleccionado !== null
	}
	
	def actualizar() {
		plato.agregarIngredienteExtra(ingredienteSeleccionado)
	}
	
}