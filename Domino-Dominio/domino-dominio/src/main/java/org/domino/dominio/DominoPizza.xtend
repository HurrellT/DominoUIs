package org.domino.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

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
		
		//realizarPedido(new Pedido(new Cliente('luca','l','lala','kasldka@a;fkas.com','5564'),new Date,'aclariacin', new RetiraPorElLocal))
	}
	
	def agregarCliente(Cliente cliente) {
		if (!clientes.stream.anyMatch [c | c.email == cliente.email]) {
			if (!clientes.stream.anyMatch [c | c.nick == cliente.nick]) {
				clientes.add(cliente)				
			}
			else {
				System.out.println("El nick "+cliente.nick+" que quiere usar ya se encuentra registrado. Por favor elija otro.")
			}
		} else {
			System.out.println("El mail "+cliente.email+" que quiere usar ya se encuentra registrado. Por favor elija otro.")
		}
	}
	
	def realizarPedido(Pedido pedido) {
		pedido.nombre =(this.historial.size + 1)
		this.historial.add(pedido)
		pedido.addObserver(this.servicio)
		pedido.cronometro.activar
	}
	
}