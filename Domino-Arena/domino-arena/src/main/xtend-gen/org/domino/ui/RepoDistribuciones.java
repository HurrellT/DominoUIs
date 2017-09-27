package org.domino.ui;

import java.util.Collections;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class RepoDistribuciones {
  private List<String> distribuciones;
  
  public RepoDistribuciones() {
    this.distribuciones = Collections.<String>unmodifiableList(CollectionLiterals.<String>newArrayList("Izquierda", "Derecha", "Toda la pizza"));
  }
  
  @Pure
  public List<String> getDistribuciones() {
    return this.distribuciones;
  }
  
  public void setDistribuciones(final List<String> distribuciones) {
    this.distribuciones = distribuciones;
  }
}
