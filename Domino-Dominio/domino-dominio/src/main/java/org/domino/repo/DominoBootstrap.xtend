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
import org.domino.dominio.EstadoPedido
import org.domino.dominio.Preparando
import org.domino.dominio.ListoParaRetirar
import org.domino.dominio.ListoParaEnviar
import org.domino.dominio.EnViaje
import org.domino.dominio.Entregado
import org.domino.dominio.Cancelado

class DominoBootstrap extends CollectionBasedBootstrap {

	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pedido), new RepoPedidos)
		ApplicationContext.instance.configureSingleton(typeof(Cliente), new RepoClientes)
		ApplicationContext.instance.configureSingleton(typeof(Ingrediente), new RepoIngredientes)
		ApplicationContext.instance.configureSingleton(typeof(Pizza), new RepoPizzas)
		ApplicationContext.instance.configureSingleton(typeof(EstadoPedido), new RepoEstados)
	}

	override run() {
		val repoPedidos = ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedidos
		val repoCliente = ApplicationContext.instance.getSingleton(typeof(Cliente)) as RepoClientes
		val repoIngredientes = ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngredientes
		val repoPizzas = ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizzas
		val repoEstados = ApplicationContext.instance.getSingleton(typeof(EstadoPedido)) as RepoEstados

		repoCliente => [
			create("Luca", "lucakapo", "alsjdnas", "luka@gmail.com", "calle 28")
			create("Pepe", "pepin", "wassa", "pepo@gmail.com", "calle 67")
			create("Cuca", "cucaracha", "tttrrr", "cuca@gmail.com", "calle 71")
		]

		val cliente1 = repoCliente.allInstances.get(0)
		val cliente2 = repoCliente.allInstances.get(1)
		val cliente3 = repoCliente.allInstances.get(2)

		val delivery = new Delivery("calle 28")

		repoPizzas => [
			create("Muzzarella", 125)
			create("Napolitana", 170)
			create("Faina", 70)
			create("Americana", 160)
			create("Calabresa", 190)
		]

		val pizza1 = repoPizzas.allInstances.get(0)
		val pizza2 = repoPizzas.allInstances.get(1)
		val pizza3 = repoPizzas.allInstances.get(2)
		
		val tamanioGrande = new Tamanio("Grande", 1)
		val tamanioChico = new Tamanio("Chica", 0.5)
		val tamanioFamiliar = new Tamanio("Familiar", 1.25)

		val plato1 = new Plato(pizza1, tamanioGrande)
		val plato2 = new Plato(pizza2, tamanioChico)
		val plato3 = new Plato(pizza3, tamanioFamiliar)

		repoIngredientes => [
			create("Jamon", 15, "Derecha")
			create("Queso", 20, "Izquierda")
			create("Anchoas", 50, "Derecha")
			create("Aceitunas", 15, "Toda la Pizza")
			create("Salchichas", 35, "Toda la Pizza")
		]

		pizza1.agregar(repoIngredientes.allInstances.get(1))
		pizza1.agregar(repoIngredientes.allInstances.get(0))
		pizza2.agregar(repoIngredientes.allInstances.get(3))
		pizza3.agregar(repoIngredientes.allInstances.get(4))
		pizza2.agregar(repoIngredientes.allInstances.get(2))
		repoPedidos => [
			create(cliente1, LocalDateTime.now, "Primer pedido", delivery)
			create(cliente2, LocalDateTime.now, "Segundo pedido", delivery)
			create(cliente3, LocalDateTime.now, "Tercer pedido", delivery)
		]
		
		repoEstados => [
			create(new Preparando)
			create(new ListoParaRetirar)
			create(new ListoParaEnviar)
			create(new EnViaje)
			create(new Entregado)
			create(new Cancelado)
		]

		val pedidosList = repoPedidos.allInstances
		pedidosList.stream.forEach[p|p.numeroDePedido = pedidosList.indexOf(p) + 1]
		pedidosList.get(0).agregarPlato(plato1)
		pedidosList.get(1).agregarPlato(plato2)
		pedidosList.get(2).agregarPlato(plato3)

	}

}
