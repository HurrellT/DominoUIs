package org.domino.ui;

import org.domino.dominio.Ingrediente;
import org.domino.dominio.Pizza;
import org.domino.model.IngredienteApplicationModel;
import org.domino.model.PizzaApplicationModel;
import org.domino.repo.RepoPizzas;
import org.domino.ui.AgregarIngredienteWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.aop.windows.TransactionalDialog;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.NumericField;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.commons.applicationContext.ApplicationContext;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.TableBuilder;
import org.uqbar.lacar.ui.model.bindings.ViewObservable;

@SuppressWarnings("all")
public class EditarPromoWindow extends TransactionalDialog<PizzaApplicationModel> {
  public EditarPromoWindow(final WindowOwner owner, final PizzaApplicationModel model) {
    super(owner, model);
    this.setTitle(this.defaultTitle());
  }
  
  public String defaultTitle() {
    return "Editar Promo";
  }
  
  @Override
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Promo");
    VerticalLayout _verticalLayout = new VerticalLayout();
    mainPanel.setLayout(_verticalLayout);
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = (Panel it) -> {
      ColumnLayout _columnLayout = new ColumnLayout(2);
      it.setLayout(_columnLayout);
    };
    final Panel panelNombre = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
    Label _label = new Label(panelNombre);
    _label.setText("Nombre");
    TextBox _textBox = new TextBox(panelNombre);
    final Procedure1<TextBox> _function_1 = (TextBox it) -> {
      ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
      ArenaXtendExtensions.operator_spaceship(_value, "pizza.nombre");
      it.setWidth(200);
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function_1);
    Panel _panel_1 = new Panel(mainPanel);
    final Procedure1<Panel> _function_2 = (Panel it) -> {
      ColumnLayout _columnLayout = new ColumnLayout(2);
      it.setLayout(_columnLayout);
    };
    final Panel panelPrecio = ObjectExtensions.<Panel>operator_doubleArrow(_panel_1, _function_2);
    Label _label_1 = new Label(panelPrecio);
    _label_1.setText("Precio");
    NumericField _numericField = new NumericField(panelPrecio);
    final Procedure1<NumericField> _function_3 = (NumericField it) -> {
      ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
      ArenaXtendExtensions.operator_spaceship(_value, "pizza.precio");
      it.setWidth(200);
    };
    ObjectExtensions.<NumericField>operator_doubleArrow(_numericField, _function_3);
    Panel _panel_2 = new Panel(mainPanel);
    final Procedure1<Panel> _function_4 = (Panel it) -> {
      VerticalLayout _verticalLayout_1 = new VerticalLayout();
      it.setLayout(_verticalLayout_1);
    };
    final Panel panelIngredientes = ObjectExtensions.<Panel>operator_doubleArrow(_panel_2, _function_4);
    Table<Ingrediente> _table = new Table<Ingrediente>(panelIngredientes, Ingrediente.class);
    final Procedure1<Table<Ingrediente>> _function_5 = (Table<Ingrediente> it) -> {
      ViewObservable<Table<Ingrediente>, TableBuilder<Ingrediente>> _items = it.items();
      ArenaXtendExtensions.operator_spaceship(_items, "pizza.ingredientes");
      ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
      ArenaXtendExtensions.operator_spaceship(_value, "ingredienteSeleccionado");
      it.setWidth(300);
    };
    final Table<Ingrediente> tabla = ObjectExtensions.<Table<Ingrediente>>operator_doubleArrow(_table, _function_5);
    this.describirIngredientes(tabla);
    Panel _panel_3 = new Panel(mainPanel);
    final Procedure1<Panel> _function_6 = (Panel it) -> {
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      it.setLayout(_horizontalLayout);
    };
    final Panel bottomButtonPanel = ObjectExtensions.<Panel>operator_doubleArrow(_panel_3, _function_6);
    this.crearPanelBotones(bottomButtonPanel);
  }
  
  public Column<Ingrediente> describirIngredientes(final Table<Ingrediente> table) {
    Column<Ingrediente> _xblockexpression = null;
    {
      Column<Ingrediente> _column = new Column<Ingrediente>(table);
      final Procedure1<Column<Ingrediente>> _function = (Column<Ingrediente> it) -> {
        it.setTitle("Nombre");
        it.bindContentsToProperty("nombre");
        it.setFixedSize(150);
      };
      ObjectExtensions.<Column<Ingrediente>>operator_doubleArrow(_column, _function);
      Column<Ingrediente> _column_1 = new Column<Ingrediente>(table);
      final Procedure1<Column<Ingrediente>> _function_1 = (Column<Ingrediente> it) -> {
        it.setTitle("Precio");
        it.bindContentsToProperty("precio");
        it.setFixedSize(150);
      };
      ObjectExtensions.<Column<Ingrediente>>operator_doubleArrow(_column_1, _function_1);
      Column<Ingrediente> _column_2 = new Column<Ingrediente>(table);
      final Procedure1<Column<Ingrediente>> _function_2 = (Column<Ingrediente> it) -> {
        it.setTitle("Distribucion");
        it.bindContentsToProperty("distribucionElegida");
        it.setFixedSize(150);
      };
      _xblockexpression = ObjectExtensions.<Column<Ingrediente>>operator_doubleArrow(_column_2, _function_2);
    }
    return _xblockexpression;
  }
  
  public Button crearPanelBotones(final Panel bottomButtonPanel) {
    Button _xblockexpression = null;
    {
      Button _button = new Button(bottomButtonPanel);
      final Procedure1<Button> _function = (Button it) -> {
        it.setCaption("Aceptar");
        it.setWidth(150);
        final Action _function_1 = () -> {
          this.accept();
        };
        it.onClick(_function_1);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(bottomButtonPanel);
      final Procedure1<Button> _function_1 = (Button it) -> {
        it.setCaption("Cancelar");
        it.setWidth(150);
        final Action _function_2 = () -> {
          this.close();
        };
        it.onClick(_function_2);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
      Button _button_2 = new Button(bottomButtonPanel);
      final Procedure1<Button> _function_2 = (Button it) -> {
        it.setCaption("Agregar Ingrediente");
        it.setWidth(150);
        final Action _function_3 = () -> {
          this.agregarIngrediente();
        };
        it.onClick(_function_3);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_2);
      Button _button_3 = new Button(bottomButtonPanel);
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
    Pizza _pizza = this.getModelObject().getPizza();
    IngredienteApplicationModel _ingredienteApplicationModel = new IngredienteApplicationModel(_pizza);
    AgregarIngredienteWindow _agregarIngredienteWindow = new AgregarIngredienteWindow(this, _ingredienteApplicationModel);
    this.openDialog(_agregarIngredienteWindow);
  }
  
  public void openDialog(final Dialog<?> dialog) {
    dialog.open();
  }
  
  @Override
  public void executeTask() {
    boolean _isNew = this.getModelObject().getPizza().isNew();
    if (_isNew) {
      this.getRepoPizzas().create(this.getModelObject().getPizza());
    } else {
      this.getRepoPizzas().update(this.getModelObject().getPizza());
    }
    super.executeTask();
  }
  
  public RepoPizzas getRepoPizzas() {
    return ApplicationContext.getInstance().<RepoPizzas>getSingleton(Pizza.class);
  }
}
