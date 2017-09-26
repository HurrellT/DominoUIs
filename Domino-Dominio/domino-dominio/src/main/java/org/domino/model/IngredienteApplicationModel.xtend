package org.domino.model

import org.domino.dominio.ConIngredientes
import org.domino.dominio.Ingrediente
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class IngredienteApplicationModel {

	Ingrediente ingredienteSeleccionado
	ConIngredientes objeto
	Ingrediente ingredienteNuevo = new Ingrediente
	String distribucionSeleccionada

	new(ConIngredientes objeto) {
		this.objeto = objeto
	}

	@Dependencies("ingredienteSeleccionado")
	def getHayIngredienteSeleccionado() {
		ingredienteSeleccionado !== null
	}

	def actualizar() {

		objeto.agregarIngrediente(
			new Ingrediente(ingredienteSeleccionado.nombre, ingredienteSeleccionado.precio, distribucionSeleccionada))

	}

}
