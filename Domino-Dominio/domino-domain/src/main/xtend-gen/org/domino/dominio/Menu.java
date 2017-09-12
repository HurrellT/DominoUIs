package org.domino.dominio;

import java.util.HashMap;
import org.domino.dominio.Ingrediente;
import org.domino.dominio.Pizza;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Menu {
  private HashMap<Ingrediente, Integer> ingredientesDisponibles;
  
  private HashMap<Pizza, Integer> promos;
  
  public Menu() {
    this.ingredientesDisponibles = CollectionLiterals.<Ingrediente, Integer>newHashMap();
    this.promos = CollectionLiterals.<Pizza, Integer>newHashMap();
  }
  
  public Integer actualizarPromo(final Pizza pizza, final Integer precio) {
    return this.promos.put(pizza, precio);
  }
  
  public Integer agregarIngrediente(final Ingrediente ingrediente, final Integer precio) {
    return this.ingredientesDisponibles.put(ingrediente, precio);
  }
  
  public Integer precioPromo(final Pizza pizza) {
    return this.promos.get(pizza);
  }
  
  public Integer precioIngrediente(final Ingrediente ingrediente) {
    return this.ingredientesDisponibles.get(ingrediente);
  }
  
  public Integer eliminarPromoDelMenu(final Pizza pizza) {
    return this.promos.remove(pizza);
  }
  
  public Integer quitarIngredienteDeMenu(final Ingrediente ingrediente) {
    return this.ingredientesDisponibles.remove(ingrediente);
  }
  
  @Pure
  public HashMap<Ingrediente, Integer> getIngredientesDisponibles() {
    return this.ingredientesDisponibles;
  }
  
  public void setIngredientesDisponibles(final HashMap<Ingrediente, Integer> ingredientesDisponibles) {
    this.ingredientesDisponibles = ingredientesDisponibles;
  }
  
  @Pure
  public HashMap<Pizza, Integer> getPromos() {
    return this.promos;
  }
  
  public void setPromos(final HashMap<Pizza, Integer> promos) {
    this.promos = promos;
  }
}
