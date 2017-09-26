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

//	override executeTask() {
//
//		if (modelObject.pizza.isNew) {
//			repoPizzas.create(modelObject.pizza)
//		} else {
//			repoPizzas.update(modelObject.pizza)
//		}
//		super.executeTask()
//	}

}
