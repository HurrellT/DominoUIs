package org.domino.ui;

import org.domino.dominio.Ingrediente;
import org.domino.model.IngredienteApplicationModel;
import org.domino.ui.RepoDistribuciones;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.aop.windows.TransactionalDialog;
import org.uqbar.arena.bindings.ObservableProperty;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.List;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.commons.applicationContext.ApplicationContext;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.bindings.ViewObservable;

@SuppressWarnings("all")
public class AgregarIngredienteWindow extends TransactionalDialog<IngredienteApplicationModel> {
  public AgregarIngredienteWindow(final WindowOwner owner, final IngredienteApplicationModel model) {
    super(owner, model);
  }
  
  @Override
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Agregue un Ingrediente");
    final Panel panelIngrediente = new Panel(mainPanel);
    this.crearListaDeIngredientes(panelIngrediente);
    final Panel panelDistribuciones = new Panel(mainPanel);
    this.crearListaDeDistribuciones(panelDistribuciones);
    final Panel panelBotones = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    panelBotones.setLayout(_horizontalLayout);
    this.crearBotones(panelBotones);
  }
  
  public List<Object> crearListaDeIngredientes(final Panel panelIngrediente) {
    List<Object> _list = new List<Object>(panelIngrediente);
    final Procedure1<List<Object>> _function = (List<Object> it) -> {
      Object _repoIngredientes = this.getRepoIngredientes();
      ObservableProperty<Object> _observableProperty = new ObservableProperty<Object>(_repoIngredientes, "ingredientes");
      it.<Object>bindItems(_observableProperty).adaptWith(Ingrediente.class, "nombre");
      ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
      ArenaXtendExtensions.operator_spaceship(_value, "ingredienteSeleccionado");
    };
    return ObjectExtensions.<List<Object>>operator_doubleArrow(_list, _function);
  }
  
  public Selector<String> crearListaDeDistribuciones(final Panel panel) {
    Selector<String> _selector = new Selector<String>(panel);
    final Procedure1<Selector<String>> _function = (Selector<String> it) -> {
      it.allowNull(false);
      ViewObservable<Control, ControlBuilder> _enabled = it.<ControlBuilder>enabled();
      ArenaXtendExtensions.operator_spaceship(_enabled, "hayIngredienteSeleccionado");
      RepoDistribuciones _repoDistribuciones = this.getRepoDistribuciones();
      ObservableProperty<Object> _observableProperty = new ObservableProperty<Object>(_repoDistribuciones, "distribuciones");
      it.<Object>bindItems(_observableProperty);
      ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
      ArenaXtendExtensions.operator_spaceship(_value, "distribucionSeleccionada");
    };
    return ObjectExtensions.<Selector<String>>operator_doubleArrow(_selector, _function);
  }
  
  public Button crearBotones(final Panel panel) {
    Button _xblockexpression = null;
    {
      Button _button = new Button(panel);
      final Procedure1<Button> _function = (Button it) -> {
        it.setCaption("Aceptar");
        final Action _function_1 = () -> {
          this.getModelObject().actualizar();
          this.accept();
        };
        it.onClick(_function_1);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(panel);
      final Procedure1<Button> _function_1 = (Button it) -> {
        it.setCaption("Cancelar");
        final Action _function_2 = () -> {
          this.cancel();
        };
        it.onClick(_function_2);
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public Object getRepoIngredientes() {
    return ApplicationContext.getInstance().<Object>getSingleton(Ingrediente.class);
  }
  
  public RepoDistribuciones getRepoDistribuciones() {
    return new RepoDistribuciones();
  }
}
