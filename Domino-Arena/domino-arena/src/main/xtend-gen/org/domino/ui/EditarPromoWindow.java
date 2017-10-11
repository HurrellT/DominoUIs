package org.domino.ui;

import org.domino.dominio.Ingrediente;
import org.domino.dominio.Pizza;
import org.domino.model.PizzaApplicationModel;
import org.domino.repo.RepoPizzas;
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
    throw new Error("Unresolved compilation problems:"
      + "\nThe field ingredienteSeleccionado is not visible");
  }
  
  public void agregarIngrediente() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field pizza is not visible");
  }
  
  public void openDialog(final Dialog<?> dialog) {
    final Action _function = () -> {
      this.getModelObject().actualizar();
    };
    dialog.onAccept(_function);
    dialog.open();
  }
  
  @Override
  public void executeTask() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field isNew is undefined for the type Pizza"
      + "\nThe field pizza is not visible"
      + "\nThe field pizza is not visible"
      + "\nThe field pizza is not visible");
  }
  
  public RepoPizzas getRepoPizzas() {
    return ApplicationContext.getInstance().<RepoPizzas>getSingleton(Pizza.class);
  }
}
