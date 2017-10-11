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
import org.domino.json.JSONViewerPedido

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
    def createPedido(@Body String body) {
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
     
    @Get("/pedidos/:id")
    def getPedidoById(){
    	response.contentType = ContentType.APPLICATION_JSON
    	val res = new JSONViewerPedido(this.dominoPizza.pedidos.findFirst[c | c.id == Integer.valueOf(id)])
    	return ok(res.toJson)
    }
    
    @Get("/pedidos[?]estado[=]:estado") //TODO: no encuentro la forma de hacer el URL correcto
    def getPedidoByState(){
    	response.contentType = ContentType.APPLICATION_JSON
    	val matchedPedidos = this.dominoPizza.pedidos.filter[c | c.estado.nombre.replaceAll("[^A-Za-z]+", "").toLowerCase == estado].toList
    	val res = matchedPedidos.map[p | new JSONViewerPedido(p)].toList
    	return ok(res.toJson)
    }
    
    private def getErrorJson(String message) {
        '{ "error": "' + message + '" }'
    }
	
}