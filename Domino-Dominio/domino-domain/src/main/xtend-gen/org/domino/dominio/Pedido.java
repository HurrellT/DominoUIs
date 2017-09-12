package org.domino.dominio;

import java.util.Date;
import java.util.List;
import java.util.Observable;
import java.util.function.ToIntFunction;
import org.domino.dominio.Cancelado;
import org.domino.dominio.Cliente;
import org.domino.dominio.Cronometro;
import org.domino.dominio.EstadoPedido;
import org.domino.dominio.FormaDeEnvio;
import org.domino.dominio.Plato;
import org.domino.dominio.Preparando;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Pedido extends Observable {
  private Cliente cliente;
  
  private Date fecha;
  
  private String aclaracion;
  
  private List<Plato> platos;
  
  private EstadoPedido estado;
  
  private FormaDeEnvio envio;
  
  private Cronometro cronometro;
  
  public Pedido(final Cliente cliente, final Date fecha, final String aclaracion, final FormaDeEnvio envio) {
    this.cliente = cliente;
    this.fecha = fecha;
    this.aclaracion = aclaracion;
    this.envio = envio;
    Preparando _preparando = new Preparando();
    this.estado = _preparando;
    this.platos = CollectionLiterals.<Plato>newArrayList();
    Cronometro _cronometro = new Cronometro();
    this.cronometro = _cronometro;
  }
  
  public EstadoPedido siguienteEstado() {
    return this.estado = this.estado.siguienteEstado(this);
  }
  
  public EstadoPedido anteriorEstado() {
    return this.estado = this.estado.anteriorEstado(this);
  }
  
  public boolean agregarPlato(final Plato plato) {
    return this.platos.add(plato);
  }
  
  public int montoTotal() {
    final ToIntFunction<Plato> _function = (Plato p) -> {
      double _montoTotal = p.montoTotal();
      return ((int) _montoTotal);
    };
    int _sum = this.platos.stream().mapToInt(_function).sum();
    int _recargo = this.envio.recargo();
    return (_sum + _recargo);
  }
  
  public EstadoPedido cancelar() {
    Cancelado _cancelado = new Cancelado();
    return this.estado = _cancelado;
  }
  
  public void cambio() {
    this.setChanged();
  }
  
  public long tiempoDelPedido() {
    return this.cronometro.tiempoEnMinutos();
  }
  
  @Pure
  public Cliente getCliente() {
    return this.cliente;
  }
  
  public void setCliente(final Cliente cliente) {
    this.cliente = cliente;
  }
  
  @Pure
  public Date getFecha() {
    return this.fecha;
  }
  
  public void setFecha(final Date fecha) {
    this.fecha = fecha;
  }
  
  @Pure
  public String getAclaracion() {
    return this.aclaracion;
  }
  
  public void setAclaracion(final String aclaracion) {
    this.aclaracion = aclaracion;
  }
  
  @Pure
  public List<Plato> getPlatos() {
    return this.platos;
  }
  
  public void setPlatos(final List<Plato> platos) {
    this.platos = platos;
  }
  
  @Pure
  public EstadoPedido getEstado() {
    return this.estado;
  }
  
  public void setEstado(final EstadoPedido estado) {
    this.estado = estado;
  }
  
  @Pure
  public FormaDeEnvio getEnvio() {
    return this.envio;
  }
  
  public void setEnvio(final FormaDeEnvio envio) {
    this.envio = envio;
  }
  
  @Pure
  public Cronometro getCronometro() {
    return this.cronometro;
  }
  
  public void setCronometro(final Cronometro cronometro) {
    this.cronometro = cronometro;
  }
}
