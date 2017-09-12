package org.domino.dominio;

import org.domino.dominio.EnViaje;
import org.domino.dominio.EstadoPedido;
import org.domino.dominio.Pedido;
import org.domino.dominio.Preparando;

@SuppressWarnings("all")
public class ListoParaEnviar implements EstadoPedido {
  @Override
  public EstadoPedido siguienteEstado(final Pedido pedido) {
    EnViaje _xblockexpression = null;
    {
      pedido.cambio();
      pedido.notifyObservers();
      _xblockexpression = new EnViaje();
    }
    return _xblockexpression;
  }
  
  @Override
  public EstadoPedido anteriorEstado(final Pedido pedido) {
    return new Preparando();
  }
}
