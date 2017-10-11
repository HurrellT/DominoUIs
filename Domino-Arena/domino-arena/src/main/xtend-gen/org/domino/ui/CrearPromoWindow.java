package org.domino.ui;

import org.domino.model.PizzaApplicationModel;
import org.domino.ui.EditarPromoWindow;
import org.uqbar.arena.windows.WindowOwner;

@SuppressWarnings("all")
public class CrearPromoWindow extends EditarPromoWindow {
  public CrearPromoWindow(final WindowOwner owner, final PizzaApplicationModel model) {
    super(owner, model);
  }
  
  @Override
  public String defaultTitle() {
    return "Agregar una nueva Promo";
  }
}
