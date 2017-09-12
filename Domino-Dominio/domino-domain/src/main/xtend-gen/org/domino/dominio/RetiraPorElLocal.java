package org.domino.dominio;

import org.domino.dominio.FormaDeEnvio;

@SuppressWarnings("all")
public class RetiraPorElLocal implements FormaDeEnvio {
  @Override
  public int recargo() {
    return 0;
  }
  
  @Override
  public boolean esDelivery() {
    return false;
  }
}
