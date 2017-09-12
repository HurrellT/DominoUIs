package org.domino.dominio;

import java.util.concurrent.TimeUnit;

@SuppressWarnings("all")
public class Cronometro {
  private boolean estaCorriendo;
  
  private long tiempoInicio;
  
  private long tiempoTranscurrido;
  
  public Cronometro() {
    this.estaCorriendo = false;
    this.tiempoInicio = 0;
    this.tiempoTranscurrido = 0;
  }
  
  public boolean activar() {
    boolean _xifexpression = false;
    if ((!this.estaCorriendo)) {
      boolean _xblockexpression = false;
      {
        this.tiempoInicio = System.nanoTime();
        _xblockexpression = this.estaCorriendo = true;
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }
  
  public boolean detener() {
    boolean _xifexpression = false;
    if (this.estaCorriendo) {
      boolean _xblockexpression = false;
      {
        long _tiempoTranscurrido = this.tiempoTranscurrido;
        long _nanoTime = System.nanoTime();
        long _minus = (_nanoTime - this.tiempoInicio);
        this.tiempoTranscurrido = (_tiempoTranscurrido + _minus);
        _xblockexpression = this.estaCorriendo = false;
      }
      _xifexpression = _xblockexpression;
    }
    return _xifexpression;
  }
  
  public long tiempoEnNanos() {
    if (this.estaCorriendo) {
      long _nanoTime = System.nanoTime();
      return (_nanoTime - this.tiempoInicio);
    }
    return this.tiempoTranscurrido;
  }
  
  public long tiempoEnMinutos() {
    return TimeUnit.MINUTES.convert(this.tiempoTranscurrido, TimeUnit.NANOSECONDS);
  }
}
