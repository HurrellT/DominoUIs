package org.domino.arena

import org.domino.dominio.DominoPizza
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class CrearIngredienteWindow extends TransactionalDialog<DominoPizza> {
	
	new(WindowOwner owner, DominoPizza model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "Ingrediente"
		
		mainPanel.layout = new ColumnLayout(2)
		
		new Label(mainPanel).text = "Nombre"
		
		new TextBox(mainPanel) => [
			value <=> "nombre"
		]
		
		new Label(mainPanel).text = "Precio"
		
		new TextBox(mainPanel) => [
			value <=> "precio"
		]
		
		new Button(mainPanel) => [
			caption = "Aceptar"
			onClick [ /* agregarIngredienteExtra(new Ingrediente(nombre, precio, distribucion)) 
			 * o this.accept  ??? */ ]
			setAsDefault
			disableOnError
		]
		
		new Button(mainPanel) => [
			caption = "Cancelar"
			onClick [this.cancel]
		]
	}
	
}