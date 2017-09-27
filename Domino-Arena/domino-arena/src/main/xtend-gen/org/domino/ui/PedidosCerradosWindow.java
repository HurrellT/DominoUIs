package org.domino.ui;

import java.time.LocalDateTime;
import org.apache.commons.collections15.Transformer;
import org.domino.dominio.EstadoPedido;
import org.domino.dominio.Pedido;
import org.domino.model.DominoApplicationModel;
import org.domino.model.PedidoApplicationModel;
import org.domino.ui.EditarPedidoWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.aop.windows.TransactionalDialog;
import org.uqbar.arena.bindings.NotNullObservable;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.widgets.tables.labelprovider.PropertyLabelProvider;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.TableBuilder;
import org.uqbar.lacar.ui.model.bindings.ViewObservable;

@SuppressWarnings("all")
public class PedidosCerradosWindow extends TransactionalDialog<DominoApplicationModel> {
  private final NotNullObservable pedidoSeleccionado = new NotNullObservable("pedidoSeleccionado");
  
  public PedidosCerradosWindow(final WindowOwner owner, final DominoApplicationModel model) {
    super(owner, model);
    this.getModelObject().actualizar();
  }
  
  @Override
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Domino Pizza");
    Label _label = new Label(mainPanel);
    final Procedure1<Label> _function = (Label it) -> {
      it.setText("Pedidos Cerrados");
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
    this.crearTablaPedidosCerrados(mainPanel);
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function_1 = (Panel it) -> {
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      it.setLayout(_horizontalLayout);
    };
    final Panel buttonPanel = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function_1);
    this.crearBotones(buttonPanel);
  }
  
  public Column<Pedido> crearTablaPedidosCerrados(final Panel panel) {
    Column<Pedido> _xblockexpression = null;
    {
      Table<Pedido> _table = new Table<Pedido>(panel, Pedido.class);
      final Procedure1<Table<Pedido>> _function = (Table<Pedido> it) -> {
        ViewObservable<Table<Pedido>, TableBuilder<Pedido>> _items = it.items();
        ArenaXtendExtensions.operator_spaceship(_items, "pedidosCerrados");
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "pedidoSeleccionado");
      };
      final Table<Pedido> tabla = ObjectExtensions.<Table<Pedido>>operator_doubleArrow(_table, _function);
      _xblockexpression = this.describirPedidosCerrados(tabla);
    }
    return _xblockexpression;
  }
  
  public Column<Pedido> describirPedidosCerrados(final Table<Pedido> table) {
    Column<Pedido> _xblockexpression = null;
    {
      Column<Pedido> _column = new Column<Pedido>(table);
      final Procedure1<Column<Pedido>> _function = (Column<Pedido> it) -> {
        it.setTitle("Pedido");
        PropertyLabelProvider<Pedido> _bindContentsToProperty = it.bindContentsToProperty("numeroDePedido");
        final Transformer<Integer, String> _function_1 = (Integer n) -> {
          return ("Pedido #" + Integer.valueOf(n));
        };
        _bindContentsToProperty.setTransformer(_function_1);
        it.setFixedSize(200);
      };
      ObjectExtensions.<Column<Pedido>>operator_doubleArrow(_column, _function);
      Column<Pedido> _column_1 = new Column<Pedido>(table);
      final Procedure1<Column<Pedido>> _function_1 = (Column<Pedido> it) -> {
        it.setTitle("Estado");
        PropertyLabelProvider<Pedido> _bindContentsToProperty = it.bindContentsToProperty("estado");
        final Transformer<EstadoPedido, String> _function_2 = (EstadoPedido e) -> {
          return e.getNombre();
        };
        _bindContentsToProperty.setTransformer(_function_2);
        it.setFixedSize(200);
      };
      ObjectExtensions.<Column<Pedido>>operator_doubleArrow(_column_1, _function_1);
      Column<Pedido> _column_2 = new Column<Pedido>(table);
      final Procedure1<Column<Pedido>> _function_2 = (Column<Pedido> it) -> {
        it.setTitle("Fecha");
        PropertyLabelProvider<Pedido> _bindContentsToProperty = it.bindContentsToProperty("fecha");
        final Transformer<LocalDateTime, String> _function_3 = (LocalDateTime f) -> {
          String _xblockexpression_1 = null;
          {
            final int dias = f.getDayOfMonth();
            final int meses = f.getMonthValue();
            final int anios = f.getYear();
            String _string = Integer.valueOf(dias).toString();
            String _plus = (_string + "/");
            String _string_1 = Integer.valueOf(meses).toString();
            String _plus_1 = (_plus + _string_1);
            String _plus_2 = (_plus_1 + "/");
            String _string_2 = Integer.valueOf(anios).toString();
            final String res = (_plus_2 + _string_2);
            _xblockexpression_1 = res;
          }
          return _xblockexpression_1;
        };
        _bindContentsToProperty.setTransformer(_function_3);
        it.setFixedSize(200);
      };
      ObjectExtensions.<Column<Pedido>>operator_doubleArrow(_column_2, _function_2);
      Column<Pedido> _column_3 = new Column<Pedido>(table);
      final Procedure1<Column<Pedido>> _function_3 = (Column<Pedido> it) -> {
        it.setTitle("Tiempo de Espera");
        it.bindContentsToProperty("tiempoDelPedido");
        it.setFixedSize(200);
      };
      _xblockexpression = ObjectExtensions.<Column<Pedido>>operator_doubleArrow(_column_3, _function_3);
    }
    return _xblockexpression;
  }
  
  public Button crearBotones(final Panel panel) {
    Button _xblockexpression = null;
    {
      Button _button = new Button(panel);
      final Procedure1<Button> _function = (Button it) -> {
        it.setCaption("Ver  ");
        it.alignRight();
        it.<Object, ControlBuilder>bindEnabled(this.pedidoSeleccionado);
        final Action _function_1 = () -> {
          this.crearEditarPedidoWindow();
        };
        it.onClick(_function_1);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(panel);
      final Procedure1<Button> _function_1 = (Button it) -> {
        it.setCaption("Volver  ");
        it.alignRight();
        final Action _function_2 = () -> {
          this.close();
        };
        it.onClick(_function_2);
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
    }
    return _xblockexpression;
  }
  
  public void crearEditarPedidoWindow() {
    Pedido _pedidoSeleccionado = this.getModelObject().getPedidoSeleccionado();
    PedidoApplicationModel _pedidoApplicationModel = new PedidoApplicationModel(_pedidoSeleccionado);
    EditarPedidoWindow _editarPedidoWindow = new EditarPedidoWindow(this, _pedidoApplicationModel);
    this.openDialog(_editarPedidoWindow);
  }
  
  public void openDialog(final Dialog<?> dialog) {
    dialog.open();
  }
}
