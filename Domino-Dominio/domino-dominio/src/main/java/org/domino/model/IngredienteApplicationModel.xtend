package org.domino.model

import org.domino.dominio.ConIngrediente
import org.domino.dominio.Ingrediente
import org.domino.dominio.Pizza
import org.domino.dominio.Plato
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.utils.ObservableUtils
import org.domino.dominio.Distribucion

@Accessors
@TransactionalAndObservable
class IngredienteApplicationModel {

	Ingrediente ingredienteSeleccionado
	Distribucion distribucionSeleccionada
	Ingrediente ingredienteNuevo = new Ingrediente
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
	
	@Dependencies("distribucionSeleccionada")
	def getHayDistribucionSeleccionada() {
		distribucionSeleccionada !== null
	}

	def actualizar() {
		objeto.agregarIngrediente(
			new Ingrediente(ingredienteSeleccionado.nombre, ingredienteSeleccionado.precio, distribucionSeleccionada))
		ObservableUtils.firePropertyChanged(this, "ingredienteNuevo", this.ingredienteNuevo)
		ObservableUtils.firePropertyChanged(this, "distribucionSeleccionada", this.distribucionSeleccionada)
		ObservableUtils.firePropertyChanged(this, "ingredienteSeleccionado", this.ingredienteSeleccionado)

	}
}
