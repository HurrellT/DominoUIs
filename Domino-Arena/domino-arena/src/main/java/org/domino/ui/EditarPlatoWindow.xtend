package org.domino.ui

import java.util.List
import org.domino.dominio.Pizza
import org.domino.dominio.Plato
import org.domino.dominio.Tamanio
import org.domino.model.PedidoApplicationModel
import org.domino.repo.RepoPizzas
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarPlatoWindow extends TransactionalDialog<Plato> {

	PedidoApplicationModel pedido

	new(WindowOwner owner, Plato model, PedidoApplicationModel pedido) {
		super(owner, model)
		title = defaultTitle
		this.pedido = pedido
	}

	def defaultTitle() {
		"Editar Plato"
	}

// ********************************************************
// ** Creacion de paneles
// ********************************************************
	override protected createFormPanel(Panel mainPanel) {

		mainPanel.layout = new VerticalLayout

		val superiorPanel = new Panel(mainPanel) => [
			layout = new ColumnLayout(2)
		]

		this.crearPanelSuperior(superiorPanel)

		val ingredientesPanel = new Panel(mainPanel) => [
			layout = new VerticalLayout
		]

		this.crearPanelIngredientes(ingredientesPanel)

		val panelPrecio = new Panel(mainPanel).layout = new HorizontalLayout

		new Label(panelPrecio).text = "Precio: $"
		new Label(panelPrecio) => [
			value <=> "montoTotal"
		]

		val panelFinal = new Panel(mainPanel).layout = new HorizontalLayout

		this.crearPanelFinal(panelFinal)

	}

// ********************************************************
// ** Creacion del panel superior
// ********************************************************
	def crearPanelSuperior(Panel superiorPanel) {
		new Label(superiorPanel).text = "Pizza"

		new Selector<Pizza>(superiorPanel) => [
			allowNull(false)
			value <=> "pizza"
			bindItems(new ObservableProperty(repoPizzas, "pizzas")).adaptWith(typeof(Pizza), "nombre")
			width = 100
		]

		new Label(superiorPanel).text = "Tamaño"

		new Selector<Tamanio>(superiorPanel) => [
			allowNull(false)
			value <=> "tamanio"
			bindItems(new ObservableProperty(repoTamanios, "tamanios")).adaptWith(typeof(Tamanio), "nombre")
			width = 100
		]
	}

// ********************************************************
// ** Creacion del panel de ingredientes
// ********************************************************
	def crearPanelIngredientes(Panel ingredientesPanel) {
		new Label(ingredientesPanel).text = "Agregados"
	}

// ********************************************************
// ** Creacion de panel final
// ********************************************************
	def crearPanelFinal(Panel panelFinal) {
		new Button(panelFinal) => [
			caption = 'Aceptar'
			width = 60

			onClick[this.accept]
		]
		new Button(panelFinal) => [
			caption = 'Cancelar'
			width = 60

			onClick[close]
		]
	}
	
// ********************************************************
// ** Acciones
// ********************************************************	
	
	override executeTask() {
		if (!pedido.pedido.platos.contains(modelObject)) {
			this.pedido.pedido.agregarPlato(modelObject)
		} else {
			this.pedido.pedido.platos.remove(modelObject)
			this.pedido.pedido.platos.add(modelObject)
		}
		super.executeTask()
	}

// ********************************************************
// ** Repositorios
// ********************************************************
	def getRepoPizzas() {
		ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizzas
	}

	def getRepoTamanios() {
		var repo = new RepoTamanios()
		repo
	}

}

// ********************************************************
// ** Definicion de RepoTamanios
// ********************************************************
@Accessors
@Observable
class RepoTamanios {

	List<Tamanio> tamanios = #[
		new Tamanio("Familiar", 1.25),
		new Tamanio("Grande", 1.0),
		new Tamanio("Chica", 0.5),
		new Tamanio("Porcion", 0.125)
	]

}
