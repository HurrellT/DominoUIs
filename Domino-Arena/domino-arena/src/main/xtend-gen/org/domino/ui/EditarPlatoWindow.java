package org.domino.ui;

import org.domino.dominio.Ingrediente;
import org.domino.dominio.Pizza;
import org.domino.dominio.Plato;
import org.domino.dominio.Tamanio;
import org.domino.model.IngredienteApplicationModel;
import org.domino.model.PedidoApplicationModel;
import org.domino.model.PlatoApplicationModel;
import org.domino.repo.RepoPizzas;
import org.domino.repo.RepoTamanios;
import org.domino.ui.AgregarIngredienteWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.aop.windows.TransactionalDialog;
import org.uqbar.arena.bindings.ObservableProperty;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.commons.applicationContext.ApplicationContext;
import org.uqbar.commons.model.utils.ObservableUtils;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.TableBuilder;
import org.uqbar.lacar.ui.model.bindings.ViewObservable;

@SuppressWarnings("all")
public class EditarPlatoWindow extends TransactionalDialog<PlatoApplicationModel> {
  public PedidoApplicationModel pedidoApplication;
  
  public EditarPlatoWindow(final WindowOwner owner, final PlatoApplicationModel model, final PedidoApplicationModel pedido) {
    super(owner, model);
    this.setTitle(this.defaultTitle());
    this.pedidoApplication = pedido;
  }
  
  public String defaultTitle() {
    return "Editar Plato";
  }
  
  @Override
  protected void createFormPanel(final Panel mainPanel) {
    VerticalLayout _verticalLayout = new VerticalLayout();
    mainPanel.setLayout(_verticalLayout);
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = (Panel it) -> {
      ColumnLayout _columnLayout = new ColumnLayout(2);
      it.setLayout(_columnLayout);
    };
    final Panel superiorPanel = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
    this.crearPanelSuperior(superiorPanel);
    Panel _panel_1 = new Panel(mainPanel);
    final Procedure1<Panel> _function_1 = (Panel it) -> {
      VerticalLayout _verticalLayout_1 = new VerticalLayout();
      it.setLayout(_verticalLayout_1);
    };
    final Panel ingredientesPanel = ObjectExtensions.<Panel>operator_doubleArrow(_panel_1, _function_1);
    this.crearPanelIngredientes(ingredientesPanel);
    Panel _panel_2 = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    final Panel panelPrecio = _panel_2.setLayout(_horizontalLayout);
    Label _label = new Label(panelPrecio);
    _label.setText("Precio: $");
    Label _label_1 = new Label(panelPrecio);
    final Procedure1<Label> _function_2 = (Label it) -> {
      ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
      ArenaXtendExtensions.operator_spaceship(_value, "plato.monto");
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_2);
    Panel _panel_3 = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout_1 = new HorizontalLayout();
    final Panel panelFinal = _panel_3.setLayout(_horizontalLayout_1);
    this.crearPanelFinal(panelFinal);
  }
  
  public Selector<Tamanio> crearPanelSuperior(final Panel superiorPanel) {
    Selector<Tamanio> _xblockexpression = null;
    {
      Label _label = new Label(superiorPanel);
      _label.setText("Pizza");
      Selector<Pizza> _selector = new Selector<Pizza>(superiorPanel);
      final Procedure1<Selector<Pizza>> _function = (Selector<Pizza> it) -> {
        it.allowNull(false);
        RepoPizzas _repoPizzas = this.getRepoPizzas();
        ObservableProperty<Object> _observableProperty = new ObservableProperty<Object>(_repoPizzas, "pizzas");
        it.<Object>bindItems(_observableProperty).adaptWith(Pizza.class, "nombre");
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "plato.pizza");
        it.setWidth(100);
      };
      ObjectExtensions.<Selector<Pizza>>operator_doubleArrow(_selector, _function);
      Label _label_1 = new Label(superiorPanel);
      _label_1.setText("Tamaño");
      Selector<Tamanio> _selector_1 = new Selector<Tamanio>(superiorPanel);
      final Procedure1<Selector<Tamanio>> _function_1 = (Selector<Tamanio> it) -> {
        it.allowNull(false);
        RepoTamanios _repoTamanios = this.getRepoTamanios();
        ObservableProperty<Object> _observableProperty = new ObservableProperty<Object>(_repoTamanios, "repoTamanios");
        it.<Object>bindItems(_observableProperty).adaptWith(Tamanio.class, "nombre");
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "plato.tamanio");
        final Action _function_2 = () -> {
          this.getModelObject().actualizar();
        };
        it.onSelection(_function_2);
        it.setWidth(100);
      };
      _xblockexpression = ObjectExtensions.<Selector<Tamanio>>operator_doubleArrow(_selector_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public Column<Ingrediente> crearPanelIngredientes(final Panel ingredientesPanel) {
    Column<Ingrediente> _xblockexpression = null;
    {
      Table<Ingrediente> _table = new Table<Ingrediente>(ingredientesPanel, Ingrediente.class);
      final Procedure1<Table<Ingrediente>> _function = (Table<Ingrediente> it) -> {
        ViewObservable<Table<Ingrediente>, TableBuilder<Ingrediente>> _items = it.items();
        ArenaXtendExtensions.operator_spaceship(_items, "plato.ingredientes");
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "ingredienteSeleccionado");
      };
      final Table<Ingrediente> table = ObjectExtensions.<Table<Ingrediente>>operator_doubleArrow(_table, _function);
      _xblockexpression = this.describirIngredientes(table);
    }
    return _xblockexpression;
  }
  
  public Column<Ingrediente> describirIngredientes(final Table<Ingrediente> table) {
    Column<Ingrediente> _xblockexpression = null;
    {
      Column<Ingrediente> _column = new Column<Ingrediente>(table);
      final Procedure1<Column<Ingrediente>> _function = (Column<Ingrediente> it) -> {
        it.setTitle("Ingrediente");
        it.setFixedSize(100);
        it.bindContentsToProperty("nombre");
      };
      ObjectExtensions.<Column<Ingrediente>>operator_doubleArrow(_column, _function);
      Column<Ingrediente> _column_1 = new Column<Ingrediente>(table);
      final Procedure1<Column<Ingrediente>> _function_1 = (Column<Ingrediente> it) -> {
        it.setTitle("Precio");
        it.setFixedSize(100);
        it.bindContentsToProperty("precio");
      };
      ObjectExtensions.<Column<Ingrediente>>operator_doubleArrow(_column_1, _function_1);
      Column<Ingrediente> _column_2 = new Column<Ingrediente>(table);
      final Procedure1<Column<Ingrediente>> _function_2 = (Column<Ingrediente> it) -> {
        it.setTitle("Distribucion");
        it.setFixedSize(100);
        it.bindContentsToProperty("distribucionElegida");
      };
      _xblockexpression = ObjectExtensions.<Column<Ingrediente>>operator_doubleArrow(_column_2, _function_2);
    }
    return _xblockexpression;
  }
  
  public Button crearPanelFinal(final Panel panelFinal) {
    Button _xblockexpression = null;
    {
      Button _button = new Button(panelFinal);
      final Procedure1<Button> _function = (Button it) -> {
        it.setCaption("Aceptar");
        it.setWidth(150);
        final Action _function_1 = () -> {
          this.accept();
          ObservableUtils.firePropertyChanged(this.pedidoApplication.getPedido(), "platos");
        };
        it.onClick(_function_1);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(panelFinal);
      final Procedure1<Button> _function_1 = (Button it) -> {
        it.setCaption("Cancelar");
        it.setWidth(150);
        final Action _function_2 = () -> {
          this.close();
        };
        it.onClick(_function_2);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
      Button _button_2 = new Button(panelFinal);
      final Procedure1<Button> _function_2 = (Button it) -> {
        it.setCaption("Agregar Ingrediente");
        it.setWidth(150);
        final Action _function_3 = () -> {
          this.agregarIngrediente();
        };
        it.onClick(_function_3);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_2);
      Button _button_3 = new Button(panelFinal);
      final Procedure1<Button> _function_3 = (Button it) -> {
        it.setCaption("Eliminar Ingrediente");
        it.setWidth(150);
        ViewObservable<Control, ControlBuilder> _enabled = it.<ControlBuilder>enabled();
        ArenaXtendExtensions.operator_spaceship(_enabled, "hayIngredienteSeleccionado");
        final Action _function_4 = () -> {
          this.getModelObject().eliminarIngrediente(this.getModelObject().getIngredienteSeleccionado());
        };
        it.onClick(_function_4);
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_3, _function_3);
    }
    return _xblockexpression;
  }
  
  public void agregarIngrediente() {
    Plato _plato = this.getModelObject().getPlato();
    IngredienteApplicationModel _ingredienteApplicationModel = new IngredienteApplicationModel(_plato);
    AgregarIngredienteWindow _agregarIngredienteWindow = new AgregarIngredienteWindow(this, _ingredienteApplicationModel);
    this.openDialog(_agregarIngredienteWindow);
  }
  
  public void openDialog(final Dialog<?> dialog) {
    final Action _function = () -> {
      this.getModelObject().actualizar();
    };
    dialog.onAccept(_function);
    dialog.open();
  }
  
  public RepoPizzas getRepoPizzas() {
    Object _singleton = ApplicationContext.getInstance().<Object>getSingleton(Pizza.class);
    return ((RepoPizzas) _singleton);
  }
  
  public RepoTamanios getRepoTamanios() {
    Object _singleton = ApplicationContext.getInstance().<Object>getSingleton(Tamanio.class);
    return ((RepoTamanios) _singleton);
  }
}
