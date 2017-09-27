package org.domino.ui;

import org.domino.dominio.Ingrediente;
import org.domino.repo.RepoIngredientes;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.aop.windows.TransactionalDialog;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.commons.applicationContext.ApplicationContext;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class EditarIngredienteWindow extends TransactionalDialog<Ingrediente> {
  public EditarIngredienteWindow(final WindowOwner owner, final Ingrediente model) {
    super(owner, model);
  }
  
  @Override
  protected void createFormPanel(final Panel mainPanel) {
    this.setTitle("Ingrediente");
    ColumnLayout _columnLayout = new ColumnLayout(2);
    mainPanel.setLayout(_columnLayout);
    new Label(mainPanel);
    Label _label = new Label(mainPanel);
    _label.setText("Nombre");
    TextBox _textBox = new TextBox(mainPanel);
    final Procedure1<TextBox> _function = (TextBox it) -> {
      ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
      ArenaXtendExtensions.operator_spaceship(_value, "nombre");
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
    Label _label_1 = new Label(mainPanel);
    _label_1.setText("Precio");
    TextBox _textBox_1 = new TextBox(mainPanel);
    final Procedure1<TextBox> _function_1 = (TextBox it) -> {
      ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
      ArenaXtendExtensions.operator_spaceship(_value, "precio");
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox_1, _function_1);
    Button _button = new Button(mainPanel);
    final Procedure1<Button> _function_2 = (Button it) -> {
      it.setCaption("Aceptar");
      final Action _function_3 = () -> {
        this.accept();
      };
      it.onClick(_function_3);
      it.setAsDefault();
      it.disableOnError();
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function_2);
    Button _button_1 = new Button(mainPanel);
    final Procedure1<Button> _function_3 = (Button it) -> {
      it.setCaption("Cancelar");
      final Action _function_4 = () -> {
        this.cancel();
      };
      it.onClick(_function_4);
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_3);
  }
  
  @Override
  public void executeTask() {
    boolean _isNew = this.getModelObject().isNew();
    if (_isNew) {
      this.getRepoIngredientes().create(this.getModelObject());
    } else {
      this.getRepoIngredientes().update(this.getModelObject());
    }
    super.executeTask();
  }
  
  public RepoIngredientes getRepoIngredientes() {
    return ApplicationContext.getInstance().<RepoIngredientes>getSingleton(Ingrediente.class);
  }
}
