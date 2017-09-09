package org.domino.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DominoPizza {
	
	Menu menu
	
	ServicioDeNotificacion servicio
	
	List<Cliente> clientes = newArrayList
	
	List<Pedido> historial = newArrayList
	
	new(Menu menu, ServicioDeNotificacion servicio){
		this.menu = menu
		this.servicio = servicio
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
		this.historial.add(pedido)
		pedido.addObserver(this.servicio)
	}
	
}