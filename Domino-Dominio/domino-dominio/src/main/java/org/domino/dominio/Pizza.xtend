package org.domino.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
<<<<<<< HEAD
import org.uqbar.commons.model.annotations.TransactionalAndObservable
=======
>>>>>>> ingrediente
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@TransactionalAndObservable
class Pizza extends Entity implements ConIngrediente {
	String nombre
	int precio
	List<Ingrediente> ingredientes
	int precioConIngredientes
	int precioDeLosIngredientes
	
	

	new(String nombre, int precio) {
		this.nombre = nombre
		this.precio = precio
		this.ingredientes = newArrayList
		this.precioConIngredientes = precio
	}
	
	new() {
		nombre =""
		precio = 0
		this.ingredientes = newArrayList
	}
	def eliminarIngrediente(Ingrediente ingred){
		ingredientes.remove(ingred)
	}
//	def setPrecio(int Precio) {
//		this.precio = precio
//		if (!ingredientes.isEmpty) {
//			this.precioConIngredientes = precio + precioDeLosIngredientes
//		}
//	}
//	
//	def precioDeLosIngredientes() {
//		precioDeLosIngredientes = 0
//		for(Ingrediente i : ingredientes) {
//			precioDeLosIngredientes = precioDeLosIngredientes + i.precio
//		}
//	}
	
	override agregarIngrediente(Ingrediente ingrediente) {
		ingredientes.add(ingrediente)
		this.precioConIngredientes = precioConIngredientes + ingrediente.precio
		ObservableUtils.firePropertyChanged(this,"ingredientes")
		ObservableUtils.firePropertyChanged(this,"precioConIngredientes")
	}
	
}