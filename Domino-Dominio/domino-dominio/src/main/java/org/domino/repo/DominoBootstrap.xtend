package org.domino.repo

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext
import org.domino.dominio.Pedido
import java.time.LocalDateTime
import org.domino.dominio.Cliente
import org.domino.dominio.Delivery
import org.domino.dominio.Plato
import org.domino.dominio.EstadoPedido
import org.domino.dominio.Ingrediente
import org.domino.dominio.Pizza

class DominoBootstrap extends CollectionBasedBootstrap {

	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pedido), new RepoPedidos)
		ApplicationContext.instance.configureSingleton(typeof(Cliente), new RepoClientes)
		ApplicationContext.instance.configureSingleton(typeof(Plato) , new RepoPlatos)
		ApplicationContext.instance.configureSingleton(typeof(Ingrediente), new RepoIngredientes)
		ApplicationContext.instance.configureSingleton(typeof(Pizza), new RepoPizzas)
	}

	override run() {
		val repoCliente = ApplicationContext.instance.getSingleton(typeof(Cliente)) as RepoClientes
		val repoPedidos = ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedidos

		repoCliente => [
			create("Luca", "lucakapo", "alsjdnas", "luka@gmail.com", "calle 28")
		]
		val cliente1 = repoCliente.allInstances.get(0)
	
		val delivery = new Delivery("calle 28")

		repoPedidos => [
			create(cliente1, LocalDateTime.now, "aclaracion", delivery)
		]
	}

}
