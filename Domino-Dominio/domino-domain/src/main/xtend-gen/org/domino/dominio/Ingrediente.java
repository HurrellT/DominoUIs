package org.domino.dominio;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Ingrediente {
  private String nombre;
  
  private int precio;
  
  private String distribucion;
  
  public Ingrediente(final String nombre, final int precio, final String distribucion) {
    this.nombre = nombre;
    this.precio = precio;
    this.distribucion = distribucion;
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
  public String getDistribucion() {
    return this.distribucion;
  }
  
  public void setDistribucion(final String distribucion) {
    this.distribucion = distribucion;
  }
}
