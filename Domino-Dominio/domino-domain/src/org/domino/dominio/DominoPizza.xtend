package org.domino.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class DominoPizza {
	
	List<Cliente> clientes = newArrayList
	
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
	
}