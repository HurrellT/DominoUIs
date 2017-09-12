package org.domino.arena

import org.domino.dominio.DominoPizza
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class CrearPedidosCerradosWindow extends TransactionalDialog<DominoPizza> {
	
	new(WindowOwner owner, DominoPizza model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = 'queso'
	}
	
}