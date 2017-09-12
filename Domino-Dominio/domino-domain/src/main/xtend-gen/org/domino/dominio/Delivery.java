package org.domino.dominio;

import org.domino.dominio.FormaDeEnvio;

@SuppressWarnings("all")
public class Delivery implements FormaDeEnvio {
  private String direccion;
  
  public Delivery(final String direccion) {
    this.direccion = direccion;
  }
  
  @Override
  public int recargo() {
    return 15;
  }
  
  @Override
  public boolean esDelivery() {
    return true;
  }
}
