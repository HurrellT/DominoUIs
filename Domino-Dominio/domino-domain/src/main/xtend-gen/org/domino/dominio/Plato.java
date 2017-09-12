package org.domino.dominio;

import java.util.List;
import org.domino.dominio.Ingrediente;
import org.domino.dominio.Pizza;
import org.domino.dominio.Tamanio;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Plato {
  private Pizza pizza;
  
  private Tamanio tamanio;
  
  private List<Ingrediente> ingredientes;
  
  public Plato(final Pizza pizza, final Tamanio tamanio) {
    this.pizza = pizza;
    this.tamanio = tamanio;
    this.ingredientes = CollectionLiterals.<Ingrediente>newArrayList();
  }
  
  public boolean agregarIngredienteExtra(final Ingrediente ingred) {
    return this.ingredientes.add(ingred);
  }
  
  public double montoTotal() {
    double _xblockexpression = (double) 0;
    {
      double monto = 0.0;
      final double custom = 70.0;
      boolean _isEmpty = this.pizza.getIngredientes().isEmpty();
      if (_isEmpty) {
        double _factor = this.tamanio.getFactor();
        double _multiply = (custom * _factor);
        monto = _multiply;
      } else {
        int _precio = this.pizza.getPrecio();
        double _factor_1 = this.tamanio.getFactor();
        double _multiply_1 = (_precio * _factor_1);
        monto = _multiply_1;
      }
      for (final Ingrediente ing : this.ingredientes) {
        double _monto = monto;
        int _precio_1 = ing.getPrecio();
        monto = (_monto + _precio_1);
      }
      _xblockexpression = monto;
    }
    return _xblockexpression;
  }
  
  @Pure
  public Pizza getPizza() {
    return this.pizza;
  }
  
  public void setPizza(final Pizza pizza) {
    this.pizza = pizza;
  }
  
  @Pure
  public Tamanio getTamanio() {
    return this.tamanio;
  }
  
  public void setTamanio(final Tamanio tamanio) {
    this.tamanio = tamanio;
  }
  
  @Pure
  public List<Ingrediente> getIngredientes() {
    return this.ingredientes;
  }
  
  public void setIngredientes(final List<Ingrediente> ingredientes) {
    this.ingredientes = ingredientes;
  }
}
