package org.domino.ui;

import java.util.Collections;
import java.util.List;
import org.domino.dominio.Cancelado;
import org.domino.dominio.EnViaje;
import org.domino.dominio.Entregado;
import org.domino.dominio.EstadoPedido;
import org.domino.dominio.ListoParaEnviar;
import org.domino.dominio.ListoParaRetirar;
import org.domino.dominio.Preparando;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.annotations.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class RepoEstados {
  private List<EstadoPedido> estados = Collections.<EstadoPedido>unmodifiableList(CollectionLiterals.<EstadoPedido>newArrayList(new Preparando(), new ListoParaRetirar(), new ListoParaEnviar(), new EnViaje(), new Entregado(), new Cancelado()));
  
  @Pure
  public List<EstadoPedido> getEstados() {
    return this.estados;
  }
  
  public void setEstados(final List<EstadoPedido> estados) {
    this.estados = estados;
  }
}
