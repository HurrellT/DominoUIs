package org.domino.dominio;

import org.domino.dominio.Entregado;
import org.domino.dominio.EstadoPedido;
import org.domino.dominio.ListoParaEnviar;
import org.domino.dominio.Pedido;

@SuppressWarnings("all")
public class EnViaje implements EstadoPedido {
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
    return new ListoParaEnviar();
  }
}
