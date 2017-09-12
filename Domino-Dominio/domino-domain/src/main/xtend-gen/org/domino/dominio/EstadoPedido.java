package org.domino.dominio;

import org.domino.dominio.Pedido;

@SuppressWarnings("all")
public interface EstadoPedido {
  public abstract EstadoPedido siguienteEstado(final Pedido pedido);
  
  public abstract EstadoPedido anteriorEstado(final Pedido pedido);
}
