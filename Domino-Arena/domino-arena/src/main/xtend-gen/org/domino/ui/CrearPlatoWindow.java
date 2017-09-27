package org.domino.ui;

import org.domino.model.PedidoApplicationModel;
import org.domino.model.PlatoApplicationModel;
import org.domino.ui.EditarPlatoWindow;
import org.uqbar.arena.windows.WindowOwner;

@SuppressWarnings("all")
public class CrearPlatoWindow extends EditarPlatoWindow {
  public CrearPlatoWindow(final WindowOwner owner, final PlatoApplicationModel plato, final PedidoApplicationModel pedido) {
    super(owner, plato, pedido);
    this.pedidoApplication = pedido;
  }
  
  @Override
  public String defaultTitle() {
    return "Agregar un nuevo Plato";
  }
  
  @Override
  public void executeTask() {
    boolean _contains = this.pedidoApplication.getPedido().getPlatos().contains(this.getModelObject().getPlato());
    boolean _not = (!_contains);
    if (_not) {
      this.pedidoApplication.getPedido().agregarPlato(this.getModelObject().getPlato());
    } else {
      this.pedidoApplication.getPedido().getPlatos().remove(this.getModelObject());
      this.pedidoApplication.getPedido().getPlatos().add(this.getModelObject().getPlato());
    }
    this.pedidoApplication.getPedido().getMontoTotal();
    super.executeTask();
  }
}
