package org.domino.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.stream.Collectors
import java.util.Date
import java.time.LocalDateTime

@Accessors
@Observable
class DominoPizza {
	
	Menu menu
	
	ServicioDeNotificacion servicio
	
	List<Cliente> clientes = newArrayList
	
	List<Pedido> historial = newArrayList
	
			
	new(Menu menu, ServicioDeNotificacion servicio){
		this.menu = menu
		this.servicio = servicio
		ServicioDeNotificacion.config(this.servicio)
		
		var p = new Pedido(new Cliente('luca','l','lala','lhazuca@gmail.com','5564'),LocalDateTime.now,'aclariacin', new RetiraPorElLocal)
		p.agregarPlato(new Plato(new Pizza("Muzza",75),new Tamanio("Grande",1)))
		realizarPedido(p)
	}
	
	def agregarCliente(Cliente cliente) {
		if (!clientes.stream.anyMatch [c | c.email == cliente.email] &&
			!clientes.stream.anyMatch [c | c.nick == cliente.nick]) {
				clientes.add(cliente)				
			}
			else {
				throw new RuntimeException("El nick "+cliente.nick+" que quiere usar ya se encuentra registrado. Por favor elija otro.")
			}
	}
	
	def realizarPedido(Pedido pedido) {
		pedido.numeroDePedido =(this.historial.size + 1)
		this.historial.add(pedido)
		pedido.addObserver(servicio)
	}
	
	/*
	 * Metodos para UI
	 */
	def getPedidosCerrados(){
		historial.stream.filter([p | p.estado.esCancelado || p.estado.esEntregado]).collect(Collectors.toList)
	}
}