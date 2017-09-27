package org.domino.ui;

import java.time.LocalDateTime;
import org.apache.commons.collections15.Transformer;
import org.domino.dominio.EstadoPedido;
import org.domino.dominio.Pedido;
import org.domino.model.DominoApplicationModel;
import org.domino.model.MenuApplicationModel;
import org.domino.model.PedidoApplicationModel;
import org.domino.ui.EditarPedidoWindow;
import org.domino.ui.MostrarMenuWindow;
import org.domino.ui.PedidosCerradosWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.NotNullObservable;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.widgets.tables.labelprovider.PropertyLabelProvider;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.commons.model.utils.ObservableUtils;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.TableBuilder;
import org.uqbar.lacar.ui.model.bindings.ViewObservable;

@SuppressWarnings("all")
public class DominoPizzaWindow extends SimpleWindow<DominoApplicationModel> {
  private final NotNullObservable elementoSeleccionado = new NotNullObservable("pedidoSeleccionado");
  
  public DominoPizzaWindow(final WindowOwner owner) {
    super(owner, new DominoApplicationModel());
    this.getModelObject().actualizar();
  }
  
  @Override
  protected void createFormPanel(final Panel mainPanel) {
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    mainPanel.setLayout(_horizontalLayout);
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = (Panel it) -> {
      VerticalLayout _verticalLayout = new VerticalLayout();
      it.setLayout(_verticalLayout);
    };
    final Panel panel = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
    this.setTitle("Domino Pizza");
    Label _label = new Label(panel);
    _label.setText("Pedidos abiertos");
    this.crearTablaPedidosAbiertos(panel);
    Panel _panel_1 = new Panel(mainPanel);
    final Procedure1<Panel> _function_1 = (Panel it) -> {
      VerticalLayout _verticalLayout = new VerticalLayout();
      it.setLayout(_verticalLayout);
    };
    final Panel buttonMainPanel = ObjectExtensions.<Panel>operator_doubleArrow(_panel_1, _function_1);
    Panel _panel_2 = new Panel(buttonMainPanel);
    final Procedure1<Panel> _function_2 = (Panel it) -> {
      ColumnLayout _columnLayout = new ColumnLayout(2);
      it.setLayout(_columnLayout);
    };
    final Panel buttonPanel1 = ObjectExtensions.<Panel>operator_doubleArrow(_panel_2, _function_2);
    this.crearBotones1(buttonPanel1);
    Panel _panel_3 = new Panel(buttonMainPanel);
    final Procedure1<Panel> _function_3 = (Panel it) -> {
      VerticalLayout _verticalLayout = new VerticalLayout();
      it.setLayout(_verticalLayout);
    };
    final Panel buttonPanel2 = ObjectExtensions.<Panel>operator_doubleArrow(_panel_3, _function_3);
    this.crearBotones2(buttonPanel2);
    Panel _panel_4 = new Panel(panel);
    final Procedure1<Panel> _function_4 = (Panel it) -> {
      HorizontalLayout _horizontalLayout_1 = new HorizontalLayout();
      it.setLayout(_horizontalLayout_1);
    };
    final Panel bottomButtonPanel = ObjectExtensions.<Panel>operator_doubleArrow(_panel_4, _function_4);
    this.crearBotonesAbajo(bottomButtonPanel);
  }
  
  public Column<Pedido> crearTablaPedidosAbiertos(final Panel panel) {
    Column<Pedido> _xblockexpression = null;
    {
      Table<Pedido> _table = new Table<Pedido>(panel, Pedido.class);
      final Procedure1<Table<Pedido>> _function = (Table<Pedido> it) -> {
        ViewObservable<Table<Pedido>, TableBuilder<Pedido>> _items = it.items();
        ArenaXtendExtensions.operator_spaceship(_items, "pedidosAbiertos");
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "pedidoSeleccionado");
      };
      final Table<Pedido> table = ObjectExtensions.<Table<Pedido>>operator_doubleArrow(_table, _function);
      _xblockexpression = this.describirPedidosAbiertos(table);
    }
    return _xblockexpression;
  }
  
  public Column<Pedido> describirPedidosAbiertos(final Table<Pedido> table) {
    Column<Pedido> _xblockexpression = null;
    {
      Column<Pedido> _column = new Column<Pedido>(table);
      final Procedure1<Column<Pedido>> _function = (Column<Pedido> it) -> {
        it.setTitle("Pedido");
        it.setFixedSize(100);
        PropertyLabelProvider<Pedido> _bindContentsToProperty = it.bindContentsToProperty("numeroDePedido");
        final Transformer<Integer, String> _function_1 = (Integer i) -> {
          return ("Pedido #" + i);
        };
        _bindContentsToProperty.setTransformer(_function_1);
      };
      ObjectExtensions.<Column<Pedido>>operator_doubleArrow(_column, _function);
      Column<Pedido> _column_1 = new Column<Pedido>(table);
      final Procedure1<Column<Pedido>> _function_1 = (Column<Pedido> it) -> {
        it.setTitle("Estado");
        it.setFixedSize(100);
        PropertyLabelProvider<Pedido> _bindContentsToProperty = it.bindContentsToProperty("estado");
        final Transformer<EstadoPedido, String> _function_2 = (EstadoPedido e) -> {
          return e.getNombre();
        };
        _bindContentsToProperty.setTransformer(_function_2);
      };
      ObjectExtensions.<Column<Pedido>>operator_doubleArrow(_column_1, _function_1);
      Column<Pedido> _column_2 = new Column<Pedido>(table);
      final Procedure1<Column<Pedido>> _function_2 = (Column<Pedido> it) -> {
        it.setTitle("Monto");
        it.setFixedSize(100);
        it.bindContentsToProperty("montoTotal");
      };
      ObjectExtensions.<Column<Pedido>>operator_doubleArrow(_column_2, _function_2);
      Column<Pedido> _column_3 = new Column<Pedido>(table);
      final Procedure1<Column<Pedido>> _function_3 = (Column<Pedido> it) -> {
        it.setTitle("Hora");
        it.setFixedSize(100);
        PropertyLabelProvider<Pedido> _bindContentsToProperty = it.bindContentsToProperty("fecha");
        final Transformer<LocalDateTime, String> _function_4 = (LocalDateTime f) -> {
          String _xblockexpression_1 = null;
          {
            int horas = f.getHour();
            int min = f.getMinute();
            String _string = Integer.valueOf(horas).toString();
            String _plus = (_string + ":");
            String _string_1 = Integer.valueOf(min).toString();
            String res = (_plus + _string_1);
            _xblockexpression_1 = res;
          }
          return _xblockexpression_1;
        };
        _bindContentsToProperty.setTransformer(_function_4);
      };
      ObjectExtensions.<Column<Pedido>>operator_doubleArrow(_column_3, _function_3);
      Column<Pedido> _column_4 = new Column<Pedido>(table);
      final Procedure1<Column<Pedido>> _function_4 = (Column<Pedido> it) -> {
        it.setTitle("Aclaracion");
        it.setFixedSize(200);
        it.bindContentsToProperty("aclaracion");
      };
      _xblockexpression = ObjectExtensions.<Column<Pedido>>operator_doubleArrow(_column_4, _function_4);
    }
    return _xblockexpression;
  }
  
  public Button crearBotones1(final Panel buttonPanel1) {
    Button _xblockexpression = null;
    {
      Button _button = new Button(buttonPanel1);
      final Procedure1<Button> _function = (Button it) -> {
        it.setCaption("<<");
        it.setWidth(50);
        ViewObservable<Control, ControlBuilder> _enabled = it.<ControlBuilder>enabled();
        ArenaXtendExtensions.operator_spaceship(_enabled, "puedeTenerEstadoAnterior");
        final Action _function_1 = () -> {
          this.getModelObject().pedidoSeleccionado.anteriorEstado();
          ObservableUtils.firePropertyChanged(this.getModelObject(), "pedidoSeleccionado.estado", this.getModelObject().pedidoSeleccionado.getEstado());
          this.getModelObject().actualizar();
        };
        it.onClick(_function_1);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(buttonPanel1);
      final Procedure1<Button> _function_1 = (Button it) -> {
        it.setCaption(">>");
        it.setWidth(50);
        it.<Object, ControlBuilder>bindEnabled(this.elementoSeleccionado);
        final Action _function_2 = () -> {
          this.getModelObject().pedidoSeleccionado.siguienteEstado();
          ObservableUtils.firePropertyChanged(this.getModelObject(), "pedidoSeleccionado.estado", this.getModelObject().pedidoSeleccionado.getEstado());
          this.getModelObject().actualizar();
        };
        it.onClick(_function_2);
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public Button crearBotones2(final Panel buttonPanel2) {
    Button _xblockexpression = null;
    {
      Button _button = new Button(buttonPanel2);
      final Procedure1<Button> _function = (Button it) -> {
        it.setCaption("Cancelar");
        it.setWidth(110);
        it.<Object, ControlBuilder>bindEnabled(this.elementoSeleccionado);
        final Action _function_1 = () -> {
          this.getModelObject().pedidoSeleccionado.cancelar();
          this.getModelObject().actualizar();
        };
        it.onClick(_function_1);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(buttonPanel2);
      final Procedure1<Button> _function_1 = (Button it) -> {
        it.setCaption("Editar");
        it.setWidth(110);
        it.<Object, ControlBuilder>bindEnabled(this.elementoSeleccionado);
        final Action _function_2 = () -> {
          this.crearEditarPedidoWindow();
        };
        it.onClick(_function_2);
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public Button crearBotonesAbajo(final Panel bottomButtonPanel) {
    Button _xblockexpression = null;
    {
      Button _button = new Button(bottomButtonPanel);
      final Procedure1<Button> _function = (Button it) -> {
        it.setCaption("Menu");
        it.setWidth(150);
        final Action _function_1 = () -> {
          this.crearMostrarMenuWindow();
        };
        it.onClick(_function_1);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(bottomButtonPanel);
      final Procedure1<Button> _function_1 = (Button it) -> {
        it.setCaption("Pedidos cerrados");
        it.setWidth(150);
        final Action _function_2 = () -> {
          this.crearPedidosCerradosWindow();
        };
        it.onClick(_function_2);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
      Button _button_2 = new Button(bottomButtonPanel);
      final Procedure1<Button> _function_2 = (Button it) -> {
        it.setCaption("Salir");
        it.setWidth(150);
        final Action _function_3 = () -> {
          this.close();
        };
        it.onClick(_function_3);
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_2);
    }
    return _xblockexpression;
  }
  
  public void crearEditarPedidoWindow() {
    PedidoApplicationModel _pedidoApplicationModel = new PedidoApplicationModel(this.getModelObject().pedidoSeleccionado);
    EditarPedidoWindow _editarPedidoWindow = new EditarPedidoWindow(this, _pedidoApplicationModel);
    this.openDialog(_editarPedidoWindow);
  }
  
  public void crearMostrarMenuWindow() {
    MenuApplicationModel _menuApplicationModel = new MenuApplicationModel();
    MostrarMenuWindow _mostrarMenuWindow = new MostrarMenuWindow(this, _menuApplicationModel);
    this.openDialog(_mostrarMenuWindow);
  }
  
  public void crearPedidosCerradosWindow() {
    DominoApplicationModel _modelObject = this.getModelObject();
    _modelObject.pedidoSeleccionado = null;
    DominoApplicationModel _modelObject_1 = this.getModelObject();
    PedidosCerradosWindow _pedidosCerradosWindow = new PedidosCerradosWindow(this, _modelObject_1);
    this.openDialog(_pedidosCerradosWindow);
  }
  
  public void openDialog(final Dialog<?> dialog) {
    final Action _function = () -> {
      this.getModelObject().actualizar();
    };
    dialog.onAccept(_function);
    dialog.open();
  }
  
  @Override
  protected void addActions(final Panel actionsPanel) {
  }
}
