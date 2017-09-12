package org.domino.dominio;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Tamanio {
  private String nombre;
  
  private double factor;
  
  public Tamanio(final String nombre, final double factor) {
    this.nombre = nombre;
    this.factor = factor;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public double getFactor() {
    return this.factor;
  }
  
  public void setFactor(final double factor) {
    this.factor = factor;
  }
}
