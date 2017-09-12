package org.domino.dominio;

import org.domino.dominio.Entregado;
import org.domino.dominio.EstadoPedido;
import org.domino.dominio.Pedido;
import org.domino.dominio.Preparando;

@SuppressWarnings("all")
public class ListoParaRetirar implements EstadoPedido {
  @Override
  public EstadoPedido siguienteEstado(final Pedido pedido) {
    Entregado _xblockexpression = null;
    {
      pedido.getCronometro().detener();
      _xblockexpression = new Entregado();
    }
    return _xblockexpression;
  }
  
  @Override
  public EstadoPedido anteriorEstado(final Pedido pedido) {
    return new Preparando();
  }
}
