package org.domino.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.utils.ObservableUtils
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@TransactionalAndObservable
class Pizza extends Entity implements ConIngrediente {
	
	String nombre
	int precio
	List<Ingrediente> ingredientes
	int precioConIngredientes
	String descripcion
	
	new(String nombre, int precio, String descripcion) {
		this.nombre = nombre
		this.precio = precio
		this.ingredientes = newArrayList
		this.precioConIngredientes = precio
		this.descripcion = descripcion
	}
	
	new() {
		this.ingredientes = newArrayList
	}
	
	def eliminarIngrediente(Ingrediente ingred){
		ingredientes.remove(ingred)
		this.precioConIngredientes = precioConIngredientes - ingred.precio
		ObservableUtils.firePropertyChanged(this,"ingredientes")
		ObservableUtils.firePropertyChanged(this,"precioConIngredientes")
	}
	
	def setPrecio(int precio) {
		this.precio = precio
		if (!ingredientes.isEmpty) {
			this.precioConIngredientes = precio + precioDeLosIngredientes
			ObservableUtils.firePropertyChanged(this,"precioConIngredientes")
		}
		else {
			this.precioConIngredientes = precio
		}
		ObservableUtils.firePropertyChanged(this,"precio")
	}
	
	@Dependencies("ingredientes")
	def precioDeLosIngredientes() {
		var precioDeLosIngredientes = 0
		for(Ingrediente i : ingredientes) {
			precioDeLosIngredientes = precioDeLosIngredientes + i.precio
		}
		precioDeLosIngredientes
	}
	
	override agregarIngrediente(Ingrediente ingrediente) {
		ingredientes.add(ingrediente)
		this.precioConIngredientes = precioConIngredientes + ingrediente.precio
		ObservableUtils.firePropertyChanged(this,"ingredientes")
		ObservableUtils.firePropertyChanged(this,"precioConIngredientes")
	}
}