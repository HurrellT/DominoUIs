package org.domino.arena

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class CrearPedidosCerradosWindow extends TransactionalDialog<AppDominoAplicationModel> {
	
	new(WindowOwner owner, AppDominoAplicationModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		title = 'queso'
	}
	
}