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

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.tables.Table
import org.domino.dominio.Ingrediente
import org.uqbar.arena.widgets.tables.Column
import org.domino.model.PlatoApplicationModel
import org.domino.model.IngredienteApplicationModel
import org.uqbar.commons.model.annotations.Dependencies


class EditarPlatoWindow extends TransactionalDialog<PlatoApplicationModel> {

	public PedidoApplicationModel pedidoApplication

	new(WindowOwner owner, PlatoApplicationModel model, PedidoApplicationModel pedido) {
		super(owner, model)
		title = defaultTitle
		this.pedidoApplication = pedido
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
			value <=> "plato.montoTotal"
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
			bindItems(new ObservableProperty(repoPizzas, "pizzas")).adaptWith(typeof(Pizza), "nombre")
			value <=> "plato.pizza"
			width = 100
		]

		new Label(superiorPanel).text = "Tamaño"

		new Selector<Tamanio>(superiorPanel) => [
			allowNull(false)
			bindItems(new ObservableProperty(repoTamanios, "tamanios")).adaptWith(typeof(Tamanio), "nombre")
			value <=> "plato.tamanio"
			width = 100
		]
	}

//// ********************************************************
//// ** Creacion del panel de ingredientes
//// ********************************************************
	def crearPanelIngredientes(Panel ingredientesPanel) {
		val table = new Table<Ingrediente>(ingredientesPanel, typeof(Ingrediente)) => [
			items <=> "ingredientesDelPlato"
			value <=> "ingredienteSeleccionado"

		]
		this.describirIngredientes(table)
	}

	def describirIngredientes(Table<Ingrediente> table) {
		new Column(table) => [
			title = "Ingrediente"
			fixedSize = 100
			bindContentsToProperty("nombre")
		]
		new Column(table) => [
			title = "Precio"
			fixedSize = 100
			bindContentsToProperty("precio")
		]
		new Column(table) => [
			title = "Distribucion"
			fixedSize = 100
			bindContentsToProperty("distribucionElegida")
		]
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
			onClick[this.close]
		]

		new Button(panelFinal) => [
			caption = 'Agregar Ingrediente'
			width = 60
			onClick[this.agregarIngrediente]
		]
	}

// ********************************************************
// ** Acciones
// ********************************************************	
	def agregarIngrediente() {
		this.openDialog(new AgregarIngredienteWindow(this, new IngredienteApplicationModel(modelObject.plato)))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.open
		dialog.onAccept[modelObject.actualizar]
	}

//	override executeTask() {
//		if (!pedidoApplication.pedido.platos.contains(modelObject.plato)) {
//			this.pedidoApplication.pedido.agregarPlato(modelObject.plato)
//		} else {
//			this.pedidoApplication.pedido.platos.remove(modelObject)
//			this.pedidoApplication.pedido.platos.add(modelObject.plato)
//		}
//		pedidoApplication.pedido.montoTotal
//		super.executeTask()
//	}
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
