package org.domino.dominio

import org.junit.Test

import static org.junit.Assert.*

class ClienteTest {
	
	String nombre 		= "Roberto"
	String nick 		= "Shrobert"
	String password		= "123password"
	String email		= "roberto_kpo125@gmail.com"
	String direccion	= "Calle Loca 1665"
	
	Cliente cliente 	= new Cliente(nombre,nick,password,email,direccion)
	
	@Test
	def test001_UnClienteTieneNombreNickPasswordMailYDireccion() {
		assertEquals(nombre,cliente.nombre)
		assertEquals(nick, cliente.nick)
		assertEquals(password, cliente.password)
		assertEquals(email,cliente.email)
		assertEquals(direccion, cliente.direccion)
	}
}