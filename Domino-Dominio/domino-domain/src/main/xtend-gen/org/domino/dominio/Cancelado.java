package org.domino.dominio;

import org.domino.dominio.EstadoPedido;
import org.domino.dominio.Pedido;

@SuppressWarnings("all")
public class Cancelado implements EstadoPedido {
  @Override
  public EstadoPedido siguienteEstado(final Pedido pedido) {
    return null;
  }
  
  @Override
  public EstadoPedido anteriorEstado(final Pedido pedido) {
    return null;
  }
}
