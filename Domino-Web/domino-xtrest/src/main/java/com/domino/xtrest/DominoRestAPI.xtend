package com.domino.xtrest

import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import java.time.LocalDateTime
import org.domino.dominio.DominoPizza
import org.domino.dominio.Pedido
import org.domino.json.JSONAdapterPedido
import org.domino.json.JSONViewerPedido
import org.domino.json.JSONViewerUsuario
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import org.domino.json.JSONAdapterEstado
import org.domino.json.JSONAdapterUsuario
import org.uqbar.commons.applicationContext.ApplicationContext
import org.domino.repo.RepoClientes
import org.domino.dominio.Cliente
import org.domino.repo.RepoPedidos

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
				val cliente = repoClientes.usuarioConId(pedidoJSON.id_usuario)
				val envio = pedidoJSON.entrega.toInstance
				val pedido = new Pedido(cliente, pedidoJSON.aclaraciones, envio);
				platos.forEach[p|pedido.agregarPlato(p)]
				this.dominoPizza.realizarPedido(pedido)
				return ok()
			} catch (UserException exception) {
				return badRequest(getErrorJson(exception.message))
			}
		} catch (UnrecognizedPropertyException exception) {
			return badRequest(getErrorJson("El body debe ser un Pedido"))
		}
	}
	
	def getRepoClientes() {
		ApplicationContext.instance.getSingleton(typeof(Cliente)) as RepoClientes
	}

	@Get("/pedidos/:id")
	def getPedidoById() {
		response.contentType = ContentType.APPLICATION_JSON
		val res = new JSONViewerPedido(repoPedidos.getPedidoConId(Integer.valueOf(id)))
		return ok(res.toJson)
	}
	
	def getRepoPedidos() {
		ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedidos
	}

	@Get("/pedidos/estados")
	def getPedidoByState(String estado) {
		response.contentType = ContentType.APPLICATION_JSON
		val matchedPedidos = this.dominoPizza.pedidos.filter [ p |
			p.estado.nombre.replaceAll("[^A-Za-z]+", "").toLowerCase == estado
		].toList
		val res = matchedPedidos.map[p|new JSONViewerPedido(p)].toList
		return ok(res.toJson)
	}

	@Get("/pedidos/user_id")
	def getPedidoByUserId(String user_id) {
		response.contentType = ContentType.APPLICATION_JSON
		val matchedPedidos = this.dominoPizza.pedidos.filter [ p |
			p.cliente.id == Integer.valueOf(user_id)
		].toList
		val res = matchedPedidos.map[p|new JSONViewerPedido(p)].toList
		return ok(res.toJson)
	}

	@Post("/pedidos/:id/estado")
	def changePedidoState(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		try {
			val estadoJSON = body.fromJson(JSONAdapterEstado
			)
			try {
				val pedido = repoPedidos.getPedidoConId(Integer.valueOf(id))
				val estado = estadoJSON.toInstance
				pedido.estado = estado
				return ok()
			} catch (UserException exception) {
				return badRequest(getErrorJson(exception.message))
			}
		} catch (UnrecognizedPropertyException exception) {
			return badRequest(getErrorJson("El body debe ser un Pedido"))
		}

	}
    
    @Get("/usuarios/:id")
    def getUsuarioById() {
    	response.contentType = ContentType.APPLICATION_JSON
    	val res = new JSONViewerUsuario(repoClientes.usuarioConId(Integer.valueOf(id)))
    	return ok(res.toJson)
    }
    
    @Put("/usuarios/:id")
    def editUsuario(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
            var userJSON = body.fromJson(JSONAdapterUsuario)
        	var usuario = repoClientes.usuarioConId(Integer.valueOf(id))
            try {
                userJSON.actualizar(usuario)
                return ok()
            } catch (UserException exception) {
                return badRequest(getErrorJson(exception.message))
            }
        } catch (UnrecognizedPropertyException exception) {
            return badRequest(getErrorJson("El body debe contener campos validos para un Usuario"))
        }
    }
    
    @Post("/usuarios")
    def createUsuario(@Body String body) {
    	response.contentType = ContentType.APPLICATION_JSON
    	try {
    		var userJSON = body.fromJson(JSONAdapterUsuario)
    		val usuario = userJSON.toInstance
    		this.dominoPizza.agregarCliente(usuario)
    		return ok()
    	} catch (UnrecognizedPropertyException exception) {
    		return badRequest(getErrorJson("El body debe contener campos validos para un Usuario"))
    	}
    	
    }
    
    @Post("/login")
    def loginUsuario(@Body String body) {
    	 response.contentType = ContentType.APPLICATION_JSON
         var userJSON = body.fromJson(JSONAdapterUsuario)
        try {
			userJSON.validarSesionDeUsuario()
                return ok()           
            }catch (UnrecognizedPropertyException exception) {
          return badRequest(getErrorJson("La contraseña o usuario no coiniciden con nuestros registros, por favor, revise los datos"))
    	}
    }
    
    private def getErrorJson(String message) {
        '{ "error": "' + message + '" }'
    }
	
}
