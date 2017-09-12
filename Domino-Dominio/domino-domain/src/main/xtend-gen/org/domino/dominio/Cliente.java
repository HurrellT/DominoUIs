package org.domino.dominio;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Cliente {
  private String nombre;
  
  private String nick;
  
  private String password;
  
  private String email;
  
  private String direccion;
  
  public Cliente(final String nombre, final String nick, final String password, final String email, final String direccion) {
    this.nombre = nombre;
    this.nick = nick;
    this.password = password;
    this.email = email;
    this.direccion = direccion;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public String getNick() {
    return this.nick;
  }
  
  public void setNick(final String nick) {
    this.nick = nick;
  }
  
  @Pure
  public String getPassword() {
    return this.password;
  }
  
  public void setPassword(final String password) {
    this.password = password;
  }
  
  @Pure
  public String getEmail() {
    return this.email;
  }
  
  public void setEmail(final String email) {
    this.email = email;
  }
  
  @Pure
  public String getDireccion() {
    return this.direccion;
  }
  
  public void setDireccion(final String direccion) {
    this.direccion = direccion;
  }
}
