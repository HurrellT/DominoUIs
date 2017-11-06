package org.domino.repo

import org.domino.dominio.Cancelado
import org.domino.dominio.Cliente
import org.domino.dominio.Delivery
import org.domino.dominio.Distribucion
import org.domino.dominio.EnViaje
import org.domino.dominio.Entregado
import org.domino.dominio.EstadoPedido
import org.domino.dominio.Ingrediente
import org.domino.dominio.ListoParaEnviar
import org.domino.dominio.ListoParaRetirar
import org.domino.dominio.Pedido
import org.domino.dominio.Pizza
import org.domino.dominio.Plato
import org.domino.dominio.Preparando
import org.domino.dominio.RetiraPorElLocal
import org.domino.dominio.Tamanio
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext

class DominoBootstrap extends CollectionBasedBootstrap {

	new() {
		ApplicationContext.instance.configureSingleton(typeof(Pedido), new RepoPedidos)
		ApplicationContext.instance.configureSingleton(typeof(Cliente), new RepoClientes)
		ApplicationContext.instance.configureSingleton(typeof(Ingrediente), new RepoIngredientes)
		ApplicationContext.instance.configureSingleton(typeof(Pizza), new RepoPizzas)
		ApplicationContext.instance.configureSingleton(typeof(EstadoPedido), new RepoEstados)
		ApplicationContext.instance.configureSingleton(typeof(Tamanio), new RepoTamanios)
	}

	override run() {
		val repoPedidos = ApplicationContext.instance.getSingleton(typeof(Pedido)) as RepoPedidos
		val repoCliente = ApplicationContext.instance.getSingleton(typeof(Cliente)) as RepoClientes
		val repoIngredientes = ApplicationContext.instance.getSingleton(typeof(Ingrediente)) as RepoIngredientes
		val repoPizzas = ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizzas
		val repoEstados = ApplicationContext.instance.getSingleton(typeof(EstadoPedido)) as RepoEstados
		val repoTamanios = ApplicationContext.instance.getSingleton(typeof(Tamanio)) as RepoTamanios

		repoCliente => [
			create("Luca", "lucakapo", "alsjdnas", "luka@gmail.com", "calle 28")
			create("Pepe", "pepin", "wassa", "pepo@gmail.com", "calle 67")
			create("Cuca", "cucaracha", "tttrrr", "cuca@gmail.com", "calle 71")
		]

		val cliente1 = repoCliente.allInstances.get(0)
		val cliente2 = repoCliente.allInstances.get(1)
		val cliente3 = repoCliente.allInstances.get(2)

		val delivery = new Delivery("calle 28")
		val retiroLocal = new RetiraPorElLocal

		repoPizzas => [
			create("Muzzarella", 125, "Pizza clasica de Muzzarela")
			create("Napolitana", 170, "Pizza clasica de Napolitana")
			create("Faina", 70, "Faina casera")
			create("Americana", 160, "Pizza con huevo frito")
			create("Calabresa", 190, "Pizza con calabresa de gran sabor")
		]

		val pizza1 = repoPizzas.allInstances.get(0)
		val pizza2 = repoPizzas.allInstances.get(1)
		val pizza3 = repoPizzas.allInstances.get(2)

		repoTamanios => [
			create("Familiar", 1.25)
			create("Grande", 1)
			create("Chica", 0.5)
			create("Porcion", 0.125)
		
		]
		
		val tamanioFamiliar= repoTamanios.allInstances.get(0)
		val tamanioGrande = repoTamanios.allInstances.get(1)
		val tamanioChico = repoTamanios.allInstances.get(2)
		
		val plato1 = new Plato(pizza1, tamanioGrande)
		val plato2 = new Plato(pizza2, tamanioChico)
		val plato3 = new Plato(pizza3, tamanioFamiliar)

		repoIngredientes => [
			create("Jamon", 15, Distribucion.DERECHA)
			create("Queso", 20, Distribucion.IZQUIERDA)
			create("Anchoas", 50, Distribucion.DERECHA)
			create("Aceitunas", 15, Distribucion.TODA)
			create("Salchichas", 35,Distribucion.TODA)
		]

		pizza1.agregarIngrediente(repoIngredientes.allInstances.get(1))
		pizza1.agregarIngrediente(repoIngredientes.allInstances.get(0))
		pizza2.agregarIngrediente(repoIngredientes.allInstances.get(3))
		pizza3.agregarIngrediente(repoIngredientes.allInstances.get(4))
		pizza2.agregarIngrediente(repoIngredientes.allInstances.get(2))
		
		repoPedidos => [
			create(cliente1, "Primer pedido", delivery)
			create(cliente2, "Segundo pedido", retiroLocal)
			create(cliente3, "Tercer pedido", delivery)
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
