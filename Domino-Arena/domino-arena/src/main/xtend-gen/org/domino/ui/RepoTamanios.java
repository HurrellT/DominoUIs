package org.domino.ui;

import java.util.Collections;
import java.util.List;
import org.domino.dominio.Tamanio;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class RepoTamanios {
  private List<Tamanio> tamanios = Collections.<Tamanio>unmodifiableList(CollectionLiterals.<Tamanio>newArrayList(new Tamanio("Familiar", 1.25), new Tamanio("Grande", 1.0), new Tamanio("Chica", 0.5), new Tamanio("Porcion", 0.125)));
  
  @Pure
  public List<Tamanio> getTamanios() {
    return this.tamanios;
  }
  
  public void setTamanios(final List<Tamanio> tamanios) {
    this.tamanios = tamanios;
  }
}
