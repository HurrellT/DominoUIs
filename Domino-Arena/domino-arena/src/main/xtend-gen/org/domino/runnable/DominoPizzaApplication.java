package org.domino.runnable;

import org.domino.repo.DominoBootstrap;
import org.domino.ui.DominoPizzaWindow;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class DominoPizzaApplication extends Application {
  public DominoPizzaApplication(final DominoBootstrap dominoBootstrap) {
    super(dominoBootstrap);
  }
  
  public static void main(final String[] args) {
    DominoBootstrap _dominoBootstrap = new DominoBootstrap();
    new DominoPizzaApplication(_dominoBootstrap).start();
  }
  
  @Override
  protected Window<?> createMainWindow() {
    return new DominoPizzaWindow(this);
  }
}
