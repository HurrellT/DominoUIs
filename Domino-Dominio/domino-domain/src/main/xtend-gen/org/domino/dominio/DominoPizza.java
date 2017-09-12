package org.domino.dominio;

import com.google.common.base.Objects;
import java.util.List;
import java.util.function.Predicate;
import org.domino.dominio.Cliente;
import org.domino.dominio.Menu;
import org.domino.dominio.Pedido;
import org.domino.dominio.ServicioDeNotificacion;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class DominoPizza {
  private Menu menu;
  
  private ServicioDeNotificacion servicio;
  
  private List<Cliente> clientes = CollectionLiterals.<Cliente>newArrayList();
  
  private List<Pedido> historial = CollectionLiterals.<Pedido>newArrayList();
  
  public DominoPizza(final Menu menu, final ServicioDeNotificacion servicio) {
    this.menu = menu;
    this.servicio = servicio;
    ServicioDeNotificacion.config(this.servicio);
  }
  
  public Boolean agregarCliente(final Cliente cliente) {
    boolean _xifexpression = false;
    final Predicate<Cliente> _function = (Cliente c) -> {
      String _email = c.getEmail();
      String _email_1 = cliente.getEmail();
      return Objects.equal(_email, _email_1);
    };
    boolean _anyMatch = this.clientes.stream().anyMatch(_function);
    boolean _not = (!_anyMatch);
    if (_not) {
      boolean _xifexpression_1 = false;
      final Predicate<Cliente> _function_1 = (Cliente c) -> {
        String _nick = c.getNick();
        String _nick_1 = cliente.getNick();
        return Objects.equal(_nick, _nick_1);
      };
      boolean _anyMatch_1 = this.clientes.stream().anyMatch(_function_1);
      boolean _not_1 = (!_anyMatch_1);
      if (_not_1) {
        _xifexpression_1 = this.clientes.add(cliente);
      } else {
        String _nick = cliente.getNick();
        String _plus = ("El nick " + _nick);
        String _plus_1 = (_plus + " que quiere usar ya se encuentra registrado. Por favor elija otro.");
        System.out.println(_plus_1);
      }
      _xifexpression = _xifexpression_1;
    } else {
      String _email = cliente.getEmail();
      String _plus_2 = ("El mail " + _email);
      String _plus_3 = (_plus_2 + " que quiere usar ya se encuentra registrado. Por favor elija otro.");
      System.out.println(_plus_3);
    }
    return Boolean.valueOf(_xifexpression);
  }
  
  public boolean realizarPedido(final Pedido pedido) {
    boolean _xblockexpression = false;
    {
      this.historial.add(pedido);
      pedido.addObserver(this.servicio);
      _xblockexpression = pedido.getCronometro().activar();
    }
    return _xblockexpression;
  }
  
  @Pure
  public Menu getMenu() {
    return this.menu;
  }
  
  public void setMenu(final Menu menu) {
    this.menu = menu;
  }
  
  @Pure
  public ServicioDeNotificacion getServicio() {
    return this.servicio;
  }
  
  public void setServicio(final ServicioDeNotificacion servicio) {
    this.servicio = servicio;
  }
  
  @Pure
  public List<Cliente> getClientes() {
    return this.clientes;
  }
  
  public void setClientes(final List<Cliente> clientes) {
    this.clientes = clientes;
  }
  
  @Pure
  public List<Pedido> getHistorial() {
    return this.historial;
  }
  
  public void setHistorial(final List<Pedido> historial) {
    this.historial = historial;
  }
}
