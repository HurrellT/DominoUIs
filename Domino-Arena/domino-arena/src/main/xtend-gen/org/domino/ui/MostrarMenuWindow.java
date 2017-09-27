package org.domino.ui;

import org.domino.dominio.Ingrediente;
import org.domino.dominio.Pizza;
import org.domino.model.MenuApplicationModel;
import org.domino.model.PizzaApplicationModel;
import org.domino.ui.EditarIngredienteWindow;
import org.domino.ui.EditarPromoWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.aop.windows.TransactionalDialog;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.TableBuilder;
import org.uqbar.lacar.ui.model.bindings.ViewObservable;

@SuppressWarnings("all")
public class MostrarMenuWindow extends TransactionalDialog<MenuApplicationModel> {
  public MostrarMenuWindow(final WindowOwner owner, final MenuApplicationModel model) {
    super(owner, model);
  }
  
  @Override
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Dominos Pizza - Menú");
    Label _label = new Label(mainPanel);
    _label.setText("Promos");
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = (Panel it) -> {
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      it.setLayout(_horizontalLayout);
    };
    final Panel panelPromos = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
    Table<Pizza> _table = new Table<Pizza>(panelPromos, Pizza.class);
    final Procedure1<Table<Pizza>> _function_1 = (Table<Pizza> it) -> {
      ViewObservable<Table<Pizza>, TableBuilder<Pizza>> _items = it.items();
      ArenaXtendExtensions.operator_spaceship(_items, "promos");
      ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
      ArenaXtendExtensions.operator_spaceship(_value, "promoSeleccionada");
    };
    final Table<Pizza> tablePromos = ObjectExtensions.<Table<Pizza>>operator_doubleArrow(_table, _function_1);
    this.describirPromos(tablePromos);
    Panel _panel_1 = new Panel(panelPromos);
    final Procedure1<Panel> _function_2 = (Panel it) -> {
      VerticalLayout _verticalLayout = new VerticalLayout();
      it.setLayout(_verticalLayout);
    };
    final Panel buttonPanel1 = ObjectExtensions.<Panel>operator_doubleArrow(_panel_1, _function_2);
    this.crearPrimerPanelBotones(buttonPanel1);
    Label _label_1 = new Label(mainPanel);
    _label_1.setText("Ingredientes Disponibles");
    final Panel panelIngredientes = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    panelIngredientes.setLayout(_horizontalLayout);
    Table<Ingrediente> _table_1 = new Table<Ingrediente>(panelIngredientes, Ingrediente.class);
    final Procedure1<Table<Ingrediente>> _function_3 = (Table<Ingrediente> it) -> {
      ViewObservable<Table<Ingrediente>, TableBuilder<Ingrediente>> _items = it.items();
      ArenaXtendExtensions.operator_spaceship(_items, "ingredientes");
      ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
      ArenaXtendExtensions.operator_spaceship(_value, "ingredienteSeleccionado");
    };
    final Table<Ingrediente> tablaIngredientes = ObjectExtensions.<Table<Ingrediente>>operator_doubleArrow(_table_1, _function_3);
    this.describirIngredientes(tablaIngredientes);
    Panel _panel_2 = new Panel(panelIngredientes);
    final Procedure1<Panel> _function_4 = (Panel it) -> {
      VerticalLayout _verticalLayout = new VerticalLayout();
      it.setLayout(_verticalLayout);
    };
    final Panel buttonPanel2 = ObjectExtensions.<Panel>operator_doubleArrow(_panel_2, _function_4);
    this.crearSegundoPanelBotones(buttonPanel2);
  }
  
  public Column<Pizza> describirPromos(final Table<Pizza> table) {
    Column<Pizza> _xblockexpression = null;
    {
      Column<Pizza> _column = new Column<Pizza>(table);
      final Procedure1<Column<Pizza>> _function = (Column<Pizza> it) -> {
        it.setTitle("Nombre");
        it.setFixedSize(200);
        it.bindContentsToProperty("nombre");
      };
      ObjectExtensions.<Column<Pizza>>operator_doubleArrow(_column, _function);
      Column<Pizza> _column_1 = new Column<Pizza>(table);
      final Procedure1<Column<Pizza>> _function_1 = (Column<Pizza> it) -> {
        it.setTitle("Precio");
        it.setFixedSize(200);
        it.bindContentsToProperty("precio");
      };
      _xblockexpression = ObjectExtensions.<Column<Pizza>>operator_doubleArrow(_column_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public Column<Ingrediente> describirIngredientes(final Table<Ingrediente> table) {
    Column<Ingrediente> _xblockexpression = null;
    {
      Column<Ingrediente> _column = new Column<Ingrediente>(table);
      final Procedure1<Column<Ingrediente>> _function = (Column<Ingrediente> it) -> {
        it.setTitle("Nombre");
        it.setFixedSize(200);
        it.bindContentsToProperty("nombre");
      };
      ObjectExtensions.<Column<Ingrediente>>operator_doubleArrow(_column, _function);
      Column<Ingrediente> _column_1 = new Column<Ingrediente>(table);
      final Procedure1<Column<Ingrediente>> _function_1 = (Column<Ingrediente> it) -> {
        it.setTitle("Precio");
        it.setFixedSize(200);
        it.bindContentsToProperty("precio");
      };
      _xblockexpression = ObjectExtensions.<Column<Ingrediente>>operator_doubleArrow(_column_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public Button crearPrimerPanelBotones(final Panel buttonPanel) {
    Button _xblockexpression = null;
    {
      Button _button = new Button(buttonPanel);
      final Procedure1<Button> _function = (Button it) -> {
        it.setCaption("Crear");
        it.setWidth(60);
        final Action _function_1 = () -> {
          Pizza _pizza = new Pizza();
          this.crearEditarPromoWindow(_pizza);
        };
        it.onClick(_function_1);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(buttonPanel);
      final Procedure1<Button> _function_1 = (Button it) -> {
        it.setCaption("Editar");
        it.setWidth(60);
        ViewObservable<Control, ControlBuilder> _enabled = it.<ControlBuilder>enabled();
        ArenaXtendExtensions.operator_spaceship(_enabled, "hayPromoSeleccionada");
        final Action _function_2 = () -> {
          this.crearEditarPromoWindow(this.getModelObject().getPromoSeleccionada());
        };
        it.onClick(_function_2);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
      Button _button_2 = new Button(buttonPanel);
      final Procedure1<Button> _function_2 = (Button it) -> {
        it.setCaption("Eliminar");
        it.setWidth(60);
        ViewObservable<Control, ControlBuilder> _enabled = it.<ControlBuilder>enabled();
        ArenaXtendExtensions.operator_spaceship(_enabled, "hayPromoSeleccionada");
        final Action _function_3 = () -> {
          this.getModelObject().getRepoPizzas().delete(this.getModelObject().getPromoSeleccionada());
          this.getModelObject().actualizar();
        };
        it.onClick(_function_3);
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_2);
    }
    return _xblockexpression;
  }
  
  public Button crearSegundoPanelBotones(final Panel buttonPanel2) {
    Button _xblockexpression = null;
    {
      Button _button = new Button(buttonPanel2);
      final Procedure1<Button> _function = (Button it) -> {
        it.setCaption("Crear");
        it.setWidth(60);
        final Action _function_1 = () -> {
          Ingrediente _ingrediente = new Ingrediente();
          this.crearEditarIngredienteWindow(_ingrediente);
        };
        it.onClick(_function_1);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(buttonPanel2);
      final Procedure1<Button> _function_1 = (Button it) -> {
        it.setCaption("Editar");
        it.setWidth(60);
        ViewObservable<Control, ControlBuilder> _enabled = it.<ControlBuilder>enabled();
        ArenaXtendExtensions.operator_spaceship(_enabled, "hayIngredienteSeleccionado");
        final Action _function_2 = () -> {
          this.crearEditarIngredienteWindow(this.getModelObject().getIngredienteSeleccionado());
        };
        it.onClick(_function_2);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
      Button _button_2 = new Button(buttonPanel2);
      final Procedure1<Button> _function_2 = (Button it) -> {
        it.setCaption("Eliminar");
        it.setWidth(60);
        ViewObservable<Control, ControlBuilder> _enabled = it.<ControlBuilder>enabled();
        ArenaXtendExtensions.operator_spaceship(_enabled, "hayIngredienteSeleccionado");
        final Action _function_3 = () -> {
          this.getModelObject().getRepoIngredientes().delete(this.getModelObject().getIngredienteSeleccionado());
          this.getModelObject().actualizar();
        };
        it.onClick(_function_3);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_2);
      Button _button_3 = new Button(buttonPanel2);
      final Procedure1<Button> _function_3 = (Button it) -> {
        it.setCaption("Cerrar");
        it.alignCenter();
        it.setWidth(50);
        final Action _function_4 = () -> {
          this.close();
        };
        it.onClick(_function_4);
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_3, _function_3);
    }
    return _xblockexpression;
  }
  
  public void crearEditarPromoWindow(final Pizza pizza) {
    PizzaApplicationModel _pizzaApplicationModel = new PizzaApplicationModel(pizza);
    EditarPromoWindow _editarPromoWindow = new EditarPromoWindow(this, _pizzaApplicationModel);
    this.openDialog(_editarPromoWindow);
  }
  
  public void crearEditarIngredienteWindow(final Ingrediente ingrediente) {
    EditarIngredienteWindow _editarIngredienteWindow = new EditarIngredienteWindow(this, ingrediente);
    this.openDialog(_editarIngredienteWindow);
  }
  
  public void openDialog(final Dialog<?> dialog) {
    final Action _function = () -> {
      this.getModelObject().actualizar();
    };
    dialog.onAccept(_function);
    dialog.open();
  }
}
