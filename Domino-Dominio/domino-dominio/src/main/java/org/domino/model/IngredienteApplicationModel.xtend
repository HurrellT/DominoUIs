package org.domino.model

import org.domino.dominio.Ingrediente
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.domino.dominio.Plato
import org.domino.dominio.Pizza
import org.domino.dominio.ConIngrediente

@Accessors
@TransactionalAndObservable
class IngredienteApplicationModel {

	Ingrediente ingredienteSeleccionado
	String distribucionSeleccionada

	Plato plato
	Pizza pizzaModel
	
	ConIngrediente objeto

	new(ConIngrediente objeto) {
		this.objeto = objeto
	}

	@Dependencies("ingredienteSeleccionado")
	def getHayIngredienteSeleccionado() {
		ingredienteSeleccionado !== null
	}

	def actualizar() {
		objeto.agregarIngrediente(
			new Ingrediente(ingredienteSeleccionado.nombre, ingredienteSeleccionado.precio, distribucionSeleccionada)
		)
	}
}
