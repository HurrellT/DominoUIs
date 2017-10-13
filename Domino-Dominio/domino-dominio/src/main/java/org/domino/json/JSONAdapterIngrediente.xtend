package org.domino.json

import org.domino.dominio.Ingrediente
import org.uqbar.commons.applicationContext.ApplicationContext
import org.domino.repo.RepoIngredientes
import org.eclipse.xtend.lib.annotations.Accessors
import org.domino.dominio.Distribucion

@Accessors
class JSONAdapterIngrediente {
	
	Integer id_ingrediente
	String posicion
	
	new(Ingrediente ingrediente) {
		this.id_ingrediente = ingrediente.id
		this.posicion = ingrediente.distribucionElegida.getName
	}
	
	new() {
		
	}
	
	def toInstance() {
		var ing = ingredientes.findFirst[i | i.id.intValue == id_ingrediente.intValue]
		
		ing.distribucionElegida = Distribucion.valueOf(this.posicion.toUpperCase)
		ing
	}
	
	def private getIngredientes() {
		val repo = ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngredientes
		repo.allInstances
	}
	
}