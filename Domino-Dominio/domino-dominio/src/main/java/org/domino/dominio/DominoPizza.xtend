package org.domino.dominio

import java.util.List
import org.domino.repo.RepoClientes
import org.domino.repo.RepoPedidos
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable 
class DominoPizza {
	
	Menu menu
	
	ServicioDeNotificacion servicio
	
	List<Cliente> clientes = newArrayList
	
			
	new(Menu menu, ServicioDeNotificacion servicio){
		this.menu = menu
		this.servicio = servicio
		ServicioDeNotificacion.config(this.servicio)
		
	}
	
	def agregarCliente(Cliente cliente) {
//		if (!clientes.stream.anyMatch [c | c.email == cliente.email] &&
//			!clientes.stream.anyMatch [c | c.nick == cliente.nick]) {
//				clientes.add(cliente)				
//			}
//			else {
//				throw new RuntimeException("El nick "+cliente.nick+" que quiere usar ya se encuentra registrado. Por favor elija otro.")
//			}
		val repoClientes = ApplicationContext.instance.getSingleton(typeof(Cliente)) as RepoClientes
		if(!clientes.stream.anyMatch [c | c.email == cliente.email] &&
			!clientes.stream.anyMatch [c | c.nick == cliente.nick]) {
				repoClientes.create(cliente)
			}
		else {
			throw new RuntimeException("El nick "+cliente.nick+" que quiere usar ya se encuentra registrado. Por favor elija otro.")
		}
	}
	
	def realizarPedido(Pedido pedido) {
		val repoPedidos = ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedidos
		repoPedidos.allInstances.stream.forEach[p | p.numeroDePedido = repoPedidos.allInstances.indexOf(p) + 1 ]
		repoPedidos.create(pedido)
		pedido.addObserver(servicio)
	}
	
	def getPedidos(){
		val repoPedidos = ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedidos
		repoPedidos.allInstances
	}
	
	def getClientes() {
		val repoClientes = ApplicationContext.instance.getSingleton(typeof(Cliente)) as RepoClientes
		repoClientes.allInstances
	} 
	
	
}