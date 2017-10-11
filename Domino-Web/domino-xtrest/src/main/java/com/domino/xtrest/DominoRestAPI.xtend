package com.domino.xtrest

import org.domino.dominio.DominoPizza
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType

@Controller
class DominoRestAPI {
	
	extension JSONUtils = new JSONUtils
	
	DominoPizza dominoPizza
	
	new(DominoPizza pizza) {
		this.dominoPizza = pizza
	}
	
	@Get("/promos")
	def getPromos(){
		response.contentType = ContentType.APPLICATION_JSON
		return ok(this.dominoPizza.menu.promos.toJson)
	}	
}