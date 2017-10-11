package com.domino.xtrest

import org.domino.dominio.DominoPizza
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import org.domino.dominio.Pedido
import org.uqbar.commons.model.exceptions.UserException
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import org.domino.json.JSONAdapterPedido
import java.time.LocalDateTime

@Controller
class DominoRestAPI {
	
	extension JSONUtils = new JSONUtils
	
	DominoPizza dominoPizza
	
	new(DominoPizza pizza) {
		this.dominoPizza = pizza
	}
	
	@Get("/promos")
	def getPromos() {
		response.contentType = ContentType.APPLICATION_JSON
		return ok(this.dominoPizza.menu.promos.toJson)
	}
	
	@Get("/tamanios")
	def getTamaniosAPI() {
		response.contentType = ContentType.APPLICATION_JSON
		return ok(this.dominoPizza.menu.tamanios.toJson)
	}
	
	@Get("/ingredientes")
	def getIngredientes() {
		response.contentType = ContentType.APPLICATION_JSON
		return ok(this.dominoPizza.menu.ingredientes.toJson)
	}
	
	@Post("/pedidos")
    def createLibro(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
            val pedidoJSON = body.fromJson(JSONAdapterPedido)
            try {
            	
            	val platos = pedidoJSON.platos
            	val cliente = this.dominoPizza.clientes.findFirst[c | c.id == pedidoJSON.id_usuario]
            	val envio = pedidoJSON.entrega.toInstance
            	val pedido = new Pedido(cliente, LocalDateTime.now,pedidoJSON.aclaraciones,envio);
            	platos.forEach[p | pedido.agregarPlato(p)]
                this.dominoPizza.realizarPedido(pedido)
                return ok()
            } catch (UserException exception) {
                return badRequest(getErrorJson(exception.message))
            }
        } catch (UnrecognizedPropertyException exception) {
            return badRequest(getErrorJson("El body debe ser un Pedido"))
        }
    }
    
    private def getErrorJson(String message) {
        '{ "error": "' + message + '" }'
    }
	
}