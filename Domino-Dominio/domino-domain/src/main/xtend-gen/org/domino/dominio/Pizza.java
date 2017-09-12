package org.domino.dominio;

import java.util.List;
import org.domino.dominio.Ingrediente;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Pizza {
  private String nombre;
  
  private int precio;
  
  private List<Ingrediente> ingredientes;
  
  public Pizza(final String nombre, final int precio) {
    this.nombre = nombre;
    this.precio = precio;
    this.ingredientes = CollectionLiterals.<Ingrediente>newArrayList();
  }
  
  public boolean agregar(final Ingrediente ingrediente) {
    return this.ingredientes.add(ingrediente);
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public int getPrecio() {
    return this.precio;
  }
  
  public void setPrecio(final int precio) {
    this.precio = precio;
  }
  
  @Pure
  public List<Ingrediente> getIngredientes() {
    return this.ingredientes;
  }
  
  public void setIngredientes(final List<Ingrediente> ingredientes) {
    this.ingredientes = ingredientes;
  }
}
