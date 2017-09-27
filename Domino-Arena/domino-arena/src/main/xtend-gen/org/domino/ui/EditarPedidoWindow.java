package org.domino.ui;

import org.apache.commons.collections15.Transformer;
import org.domino.dominio.EstadoPedido;
import org.domino.dominio.Pedido;
import org.domino.dominio.Pizza;
import org.domino.dominio.Plato;
import org.domino.dominio.Tamanio;
import org.domino.model.PedidoApplicationModel;
import org.domino.model.PlatoApplicationModel;
import org.domino.repo.RepoPedidos;
import org.domino.ui.CrearPlatoWindow;
import org.domino.ui.EditarPlatoWindow;
import org.domino.ui.RepoEstados;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.aop.windows.TransactionalDialog;
import org.uqbar.arena.bindings.ObservableProperty;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.widgets.tables.labelprovider.PropertyLabelProvider;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.commons.applicationContext.ApplicationContext;
import org.uqbar.commons.model.annotations.Transactional;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.TableBuilder;
import org.uqbar.lacar.ui.model.bindings.ViewObservable;

@Transactional
@SuppressWarnings("all")
public class EditarPedidoWindow extends TransactionalDialog<PedidoApplicationModel> {
  public EditarPedidoWindow(final WindowOwner owner, final PedidoApplicationModel model) {
    super(owner, model);
  }
  
  @Override
  protected void createFormPanel(final Panel mainPanel) {
    Integer _numeroDePedido = this.getModelObject().getPedido().getNumeroDePedido();
    String _plus = ("Pedido #" + _numeroDePedido);
    this.setTitle(_plus);
    final Panel panelEstado = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout = new HorizontalLayout();
    panelEstado.setLayout(_horizontalLayout);
    this.crearPanelEstado(panelEstado);
    final Panel panelPlatos = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout_1 = new HorizontalLayout();
    panelPlatos.setLayout(_horizontalLayout_1);
    this.crearPanelPlatos(panelPlatos);
    final Panel buttonPanel = new Panel(panelPlatos);
    this.crearBotonesParaPlatos(buttonPanel);
    final Panel panelAclaracion = new Panel(mainPanel);
    Label _label = new Label(panelAclaracion);
    _label.setText("Aclaraciones");
    TextBox _textBox = new TextBox(panelAclaracion);
    final Procedure1<TextBox> _function = (TextBox it) -> {
      ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
      ArenaXtendExtensions.operator_spaceship(_value, "pedido.aclaracion");
      ViewObservable<Control, ControlBuilder> _enabled = it.<ControlBuilder>enabled();
      ArenaXtendExtensions.operator_spaceship(_enabled, "pedido.esAbierto");
      it.setHeight(200);
      it.setWidth(200);
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
    final Panel panelDatos = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    panelDatos.setLayout(_columnLayout);
    this.crearPanelDeDatos(panelDatos);
    final Panel panelBotones = new Panel(mainPanel);
    HorizontalLayout _horizontalLayout_2 = new HorizontalLayout();
    panelBotones.setLayout(_horizontalLayout_2);
    Button _button = new Button(panelBotones);
    final Procedure1<Button> _function_1 = (Button it) -> {
      it.setCaption("Aceptar");
      final Action _function_2 = () -> {
        this.accept();
      };
      it.onClick(_function_2);
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function_1);
    Button _button_1 = new Button(panelBotones);
    final Procedure1<Button> _function_2 = (Button it) -> {
      it.setCaption("Cancelar");
      final Action _function_3 = () -> {
        this.close();
      };
      it.onClick(_function_3);
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_2);
  }
  
  public Selector<EstadoPedido> crearPanelEstado(final Panel panelEstado) {
    Selector<EstadoPedido> _xblockexpression = null;
    {
      Label _label = new Label(panelEstado);
      _label.setText("Estado");
      Selector<EstadoPedido> _selector = new Selector<EstadoPedido>(panelEstado);
      final Procedure1<Selector<EstadoPedido>> _function = (Selector<EstadoPedido> it) -> {
        it.allowNull(false);
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "estadoSeleccionado");
        ViewObservable<Control, ControlBuilder> _enabled = it.<ControlBuilder>enabled();
        ArenaXtendExtensions.operator_spaceship(_enabled, "pedido.esAbierto");
        RepoEstados _repoEstados = this.getRepoEstados();
        ObservableProperty<Object> _observableProperty = new ObservableProperty<Object>(_repoEstados, "estados");
        it.<Object>bindItems(_observableProperty).adaptWith(EstadoPedido.class, "nombre");
      };
      _xblockexpression = ObjectExtensions.<Selector<EstadoPedido>>operator_doubleArrow(_selector, _function);
    }
    return _xblockexpression;
  }
  
  public Column<Plato> crearPanelPlatos(final Panel panelPlatos) {
    Column<Plato> _xblockexpression = null;
    {
      Label _label = new Label(panelPlatos);
      _label.setText("Platos");
      Table<Plato> _table = new Table<Plato>(panelPlatos, Plato.class);
      final Procedure1<Table<Plato>> _function = (Table<Plato> it) -> {
        ViewObservable<Table<Plato>, TableBuilder<Plato>> _items = it.items();
        ArenaXtendExtensions.operator_spaceship(_items, "pedido.platos");
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "platoSeleccionado");
      };
      final Table<Plato> table = ObjectExtensions.<Table<Plato>>operator_doubleArrow(_table, _function);
      _xblockexpression = this.describirTablaDePlatos(table);
    }
    return _xblockexpression;
  }
  
  public Column<Plato> describirTablaDePlatos(final Table<Plato> table) {
    Column<Plato> _xblockexpression = null;
    {
      Column<Plato> _column = new Column<Plato>(table);
      final Procedure1<Column<Plato>> _function = (Column<Plato> it) -> {
        it.setTitle("Pizza");
        it.setFixedSize(200);
        PropertyLabelProvider<Plato> _bindContentsToProperty = it.bindContentsToProperty("pizza");
        final Transformer<Pizza, String> _function_1 = (Pizza p) -> {
          return p.getNombre();
        };
        _bindContentsToProperty.setTransformer(_function_1);
      };
      ObjectExtensions.<Column<Plato>>operator_doubleArrow(_column, _function);
      Column<Plato> _column_1 = new Column<Plato>(table);
      final Procedure1<Column<Plato>> _function_1 = (Column<Plato> it) -> {
        it.setTitle("Tamaño");
        it.setFixedSize(200);
        PropertyLabelProvider<Plato> _bindContentsToProperty = it.bindContentsToProperty("tamanio");
        final Transformer<Tamanio, String> _function_2 = (Tamanio t) -> {
          return t.getNombre();
        };
        _bindContentsToProperty.setTransformer(_function_2);
      };
      ObjectExtensions.<Column<Plato>>operator_doubleArrow(_column_1, _function_1);
      Column<Plato> _column_2 = new Column<Plato>(table);
      final Procedure1<Column<Plato>> _function_2 = (Column<Plato> it) -> {
        it.setTitle("Precio");
        it.setFixedSize(200);
        it.bindContentsToProperty("montoTotal");
      };
      _xblockexpression = ObjectExtensions.<Column<Plato>>operator_doubleArrow(_column_2, _function_2);
    }
    return _xblockexpression;
  }
  
  public Button crearBotonesParaPlatos(final Panel panel) {
    Button _xblockexpression = null;
    {
      Button _button = new Button(panel);
      final Procedure1<Button> _function = (Button it) -> {
        it.setCaption("Agregar");
        ViewObservable<Control, ControlBuilder> _enabled = it.<ControlBuilder>enabled();
        ArenaXtendExtensions.operator_spaceship(_enabled, "pedido.esAbierto");
        final Action _function_1 = () -> {
          this.crearPlato();
        };
        it.onClick(_function_1);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      Button _button_1 = new Button(panel);
      final Procedure1<Button> _function_1 = (Button it) -> {
        it.setCaption("Editar");
        ViewObservable<Control, ControlBuilder> _enabled = it.<ControlBuilder>enabled();
        ArenaXtendExtensions.operator_spaceship(_enabled, "hayPlatoSeleccionado");
        ViewObservable<Control, ControlBuilder> _enabled_1 = it.<ControlBuilder>enabled();
        ArenaXtendExtensions.operator_spaceship(_enabled_1, "pedido.esAbierto");
        final Action _function_2 = () -> {
          this.editarPlato();
        };
        it.onClick(_function_2);
      };
      ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
      Button _button_2 = new Button(panel);
      final Procedure1<Button> _function_2 = (Button it) -> {
        it.setCaption("Eliminar");
        ViewObservable<Control, ControlBuilder> _enabled = it.<ControlBuilder>enabled();
        ArenaXtendExtensions.operator_spaceship(_enabled, "hayPlatoSeleccionado");
        ViewObservable<Control, ControlBuilder> _enabled_1 = it.<ControlBuilder>enabled();
        ArenaXtendExtensions.operator_spaceship(_enabled_1, "pedido.esAbierto");
        final Action _function_3 = () -> {
          this.getModelObject().getPedido().getPlatos().remove(this.getModelObject().getPlatoSeleccionado());
        };
        it.onClick(_function_3);
      };
      _xblockexpression = ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_2);
    }
    return _xblockexpression;
  }
  
  public Label crearPanelDeDatos(final Panel panelDatos) {
    Label _xblockexpression = null;
    {
      Label _label = new Label(panelDatos);
      _label.setText("Cliente");
      Label _label_1 = new Label(panelDatos);
      final Procedure1<Label> _function = (Label it) -> {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "pedido.cliente.nombre");
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function);
      Label _label_2 = new Label(panelDatos);
      _label_2.setText("Costo de envio");
      Label _label_3 = new Label(panelDatos);
      final Procedure1<Label> _function_1 = (Label it) -> {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "pedido.envio.recargo");
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_3, _function_1);
      Label _label_4 = new Label(panelDatos);
      _label_4.setText("Monto total");
      Label _label_5 = new Label(panelDatos);
      final Procedure1<Label> _function_2 = (Label it) -> {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "pedido.montoTotal");
      };
      ObjectExtensions.<Label>operator_doubleArrow(_label_5, _function_2);
      Label _label_6 = new Label(panelDatos);
      _label_6.setText("Fecha");
      Label _label_7 = new Label(panelDatos);
      final Procedure1<Label> _function_3 = (Label it) -> {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "fechaTransformada");
      };
      _xblockexpression = ObjectExtensions.<Label>operator_doubleArrow(_label_7, _function_3);
    }
    return _xblockexpression;
  }
  
  public void editarPlato() {
    Plato _platoSeleccionado = this.getModelObject().getPlatoSeleccionado();
    PlatoApplicationModel _platoApplicationModel = new PlatoApplicationModel(_platoSeleccionado);
    PedidoApplicationModel _modelObject = this.getModelObject();
    EditarPlatoWindow _editarPlatoWindow = new EditarPlatoWindow(this, _platoApplicationModel, _modelObject);
    this.openDialog(_editarPlatoWindow);
  }
  
  public void crearPlato() {
    Plato _plato = new Plato();
    PlatoApplicationModel _platoApplicationModel = new PlatoApplicationModel(_plato);
    PedidoApplicationModel _modelObject = this.getModelObject();
    CrearPlatoWindow _crearPlatoWindow = new CrearPlatoWindow(this, _platoApplicationModel, _modelObject);
    this.openDialog(_crearPlatoWindow);
  }
  
  public void openDialog(final Dialog<?> dialog) {
    dialog.open();
  }
  
  @Override
  public void executeTask() {
    boolean _isNew = this.getModelObject().getPedido().isNew();
    if (_isNew) {
      this.getRepoPedidos().create(this.getModelObject().getPedido());
    } else {
      this.getRepoPedidos().update(this.getModelObject().getPedido());
    }
    super.executeTask();
  }
  
  public RepoPedidos getRepoPedidos() {
    return ApplicationContext.getInstance().<RepoPedidos>getSingleton(Pedido.class);
  }
  
  public RepoEstados getRepoEstados() {
    RepoEstados _xblockexpression = null;
    {
      RepoEstados repo = new RepoEstados();
      _xblockexpression = repo;
    }
    return _xblockexpression;
  }
}
