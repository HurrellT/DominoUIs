package org.domino.json

import org.domino.dominio.Ingrediente
import org.uqbar.commons.applicationContext.ApplicationContext
import org.domino.repo.RepoIngredientes
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JSONAdapterIngrediente {
	
	Integer id_ingrediente
	String posicion
	
	def toInstance() {
		var ing = ingredientes.findFirst[i | i.id.intValue == id_ingrediente.intValue]
		
		ing.distribucionElegida = posicion // TODO: esto tiene que estar uniforme en todos lados (repo o enum de distribuciones)
		
		ing
	}
	
	def getIngredientes() {
		val repo = ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngredientes
		repo.allInstances
	}
	
}