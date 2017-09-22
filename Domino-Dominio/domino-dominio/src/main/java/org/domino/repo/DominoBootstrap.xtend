package org.domino.repo

import java.time.LocalDateTime
import org.domino.dominio.Cliente
import org.domino.dominio.Delivery
import org.domino.dominio.Ingrediente
import org.domino.dominio.Pedido
import org.domino.dominio.Pizza
import org.domino.dominio.Plato
import org.domino.dominio.Tamanio
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext

class DominoBootstrap extends CollectionBasedBootstrap {

	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pedido), new RepoPedidos)
		ApplicationContext.instance.configureSingleton(typeof(Cliente), new RepoClientes)
		ApplicationContext.instance.configureSingleton(typeof(Plato) , new RepoPlatos)
		ApplicationContext.instance.configureSingleton(typeof(Ingrediente), new RepoIngredientes)
		ApplicationContext.instance.configureSingleton(typeof(Pizza), new RepoPizzas)
	}

	override run() {
		val repoPedidos = ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedidos
		val repoCliente = ApplicationContext.instance.getSingleton(typeof(Cliente)) as RepoClientes
		val repoPlatos	= ApplicationContext.instance.getSingleton(typeof(Plato)) as RepoPlatos
		val repoIngredientes = ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngredientes
		val repoPizzas = ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizzas

		
		repoCliente => [
			create("Luca", "lucakapo", "alsjdnas", "luka@gmail.com", "calle 28")
			create("Pepe", "pepin", "wassa", "pepo@gmail.com", "calle 28")
		]
		
		val cliente1 = repoCliente.allInstances.get(0)
		val cliente2 = repoCliente.allInstances.get(1)
	
		val delivery = new Delivery("calle 28")
		
		
		repoPizzas => [
			create("Muzza",125)
		]
		
		val pizzaMuzza = repoPizzas.allInstances.get(0)
		
		val tamanioMuzza = new Tamanio("Grande",1)
		
		
		repoPlatos => [
			create(pizzaMuzza,tamanioMuzza)
		]
		
		val plato1 = repoPlatos.allInstances.get(0)
		
		repoIngredientes => [
			create("Jamon",15,"Derecha")
			create("Queso",20,"Izquierda")
		]

		repoPedidos => [
			create(cliente1, LocalDateTime.now, "aclaracion", delivery)
			create(cliente2, LocalDateTime.now, "segundo Pedido", delivery)
		]
		
		val pedidosList = repoPedidos.allInstances
		pedidosList.stream.forEach[p | p.numeroDePedido = pedidosList.indexOf(p) + 1 ]
		pedidosList.stream.forEach[p | p.agregarPlato(plato1)]
		
	}

}
