package org.domino.dominio;

import org.domino.dominio.EstadoPedido;
import org.domino.dominio.ListoParaEnviar;
import org.domino.dominio.ListoParaRetirar;
import org.domino.dominio.Pedido;

@SuppressWarnings("all")
public class Preparando implements EstadoPedido {
  @Override
  public EstadoPedido siguienteEstado(final Pedido pedido) {
    EstadoPedido _xifexpression = null;
    boolean _esDelivery = pedido.getEnvio().esDelivery();
    if (_esDelivery) {
      _xifexpression = new ListoParaEnviar();
    } else {
      _xifexpression = new ListoParaRetirar();
    }
    return _xifexpression;
  }
  
  @Override
  public EstadoPedido anteriorEstado(final Pedido pedido) {
    return null;
  }
}
