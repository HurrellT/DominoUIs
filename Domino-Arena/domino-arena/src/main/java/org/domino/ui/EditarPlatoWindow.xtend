package org.domino.ui

import org.domino.dominio.Ingrediente
import org.domino.dominio.Pizza
import org.domino.dominio.Tamanio
import org.domino.model.IngredienteApplicationModel
import org.domino.model.PedidoApplicationModel
import org.domino.model.PlatoApplicationModel
import org.domino.repo.RepoPizzas
import org.domino.repo.RepoTamanios
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.applicationContext.ApplicationContext

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import java.util.List
import org.uqbar.commons.model.utils.ObservableUtils
import org.uqbar.arena.bindings.NotNullObservable

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
			value <=> "plato.monto"
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
			onSelection[modelObject.pizzaSeleccionada = modelObject.plato.pizza]

			width = 100
		]

		new Label(superiorPanel).text = "Tamaño"

		new Selector<Tamanio>(superiorPanel) => [
			allowNull(false)
			bindItems(new ObservableProperty(repoTamanios, "repoTamanios")).adaptWith(typeof(Tamanio), "nombre")
			value <=> "plato.tamanio"
			onSelection[
				modelObject.tamanioSeleccionado = modelObject.plato.tamanio
				modelObject.actualizar
			]
			width = 100
		]
	}

//// ********************************************************
//// ** Creacion del panel de ingredientes
//// ********************************************************
	def crearPanelIngredientes(Panel ingredientesPanel) {
		val table = new Table<Ingrediente>(ingredientesPanel, typeof(Ingrediente)) => [
			items <=> "plato.ingredientes"
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
			width = 150
			enabled <=> "puedeAceptar"
			onClick[this.accept
				ObservableUtils.firePropertyChanged(pedidoApplication.pedido, "platos")
			]
		]

		new Button(panelFinal) => [
			caption = 'Cancelar'
			width = 150
			onClick[this.cancel]
		]

		new Button(panelFinal) => [
			caption = 'Agregar Ingrediente'
			width = 150
			onClick[this.agregarIngrediente]
			enabled <=> "puedeAceptar"

		]
		new Button(panelFinal) => [
			caption = 'Eliminar Ingrediente'
			width = 150
			enabled <=> "hayIngredienteSeleccionado"
			onClick[modelObject.plato.eliminarIngrediente(modelObject.ingredienteSeleccionado)]

		]
	}

// ********************************************************
// ** Acciones
// ********************************************************	
	def agregarIngrediente() {
		this.openDialog(new AgregarIngredienteWindow(this, new IngredienteApplicationModel(modelObject.plato)))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[modelObject.actualizar]
		dialog.open
	}
	
// ********************************************************
// ** Repositorios
// ********************************************************
	def getRepoPizzas() {
		ApplicationContext.instance.getSingleton(typeof(Pizza)) as RepoPizzas
	}

	def getRepoTamanios() {
		ApplicationContext.instance.getSingleton(typeof(Tamanio)) as RepoTamanios
	}

}
