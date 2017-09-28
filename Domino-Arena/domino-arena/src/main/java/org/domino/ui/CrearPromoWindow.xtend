package org.domino.ui

import org.domino.model.PizzaApplicationModel
import org.uqbar.arena.windows.WindowOwner

class CrearPromoWindow extends EditarPromoWindow {

	new(WindowOwner owner, PizzaApplicationModel model) {
		super(owner, model)
	}

	override defaultTitle() {
		"Agregar una nueva Promo"
	}

}
