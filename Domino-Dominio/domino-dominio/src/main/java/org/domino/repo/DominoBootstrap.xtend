package org.domino.repo

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext
import org.domino.dominio.Pedido

class DominoBootstrap extends CollectionBasedBootstrap{
	
	
	new(){
		ApplicationContext.instance.configureSingleton(typeof(Pedido),new RepoPedidos)
	}
	override run() {
	}
	
}