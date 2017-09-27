package org.domino.model

import java.util.List
import org.domino.dominio.Ingrediente
import org.domino.dominio.Pizza
import org.domino.repo.RepoIngredientes
import org.domino.repo.RepoPizzas
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class MenuApplicationModel extends ApplicationContext {

	//Menu menu
	RepoPizzas repoPromos
	List<Pizza> promos
	RepoIngredientes repoIngredientes
	List<Ingrediente> ingredientes
	Pizza promoSeleccionada
	Ingrediente ingredienteSeleccionado

	new() {
		this.actualizar
	}
	
	def RepoPizzas getRepoPizzas() {
		repoPromos = ApplicationContext.instance.getSingleton(typeof(Pizza))
	}
	
	def RepoIngredientes getRepoIngredientes() {
		repoIngredientes = ApplicationContext.instance.getSingleton(typeof(Ingrediente))
	}

	@Dependencies("promoSeleccionada")
	def getHayPromoSeleccionada() {
		promoSeleccionada !== null
	}

	@Dependencies("ingredienteSeleccionado")
	def getHayIngredienteSeleccionado() {
		ingredienteSeleccionado !== null
	}
	
		
	/*
	 * Metodos para UI
	 */
	
	def actualizar() {
		var repoPromos = ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizzas
		var repoIngredientes = ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngredientes
		
	 	promos = repoPromos.allInstances
	 	ingredientes = repoIngredientes.allInstances
	 	
	 	ObservableUtils.firePropertyChanged(this,"promos",this.promos)
	 	ObservableUtils.firePropertyChanged(this,"ingredientes",this.ingredientes)
	}

}
