package org.domino.dominio;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

@SuppressWarnings("all")
public class UserPasswordAuthentication extends Authenticator {
  private final String username;
  
  private final String password;
  
  public UserPasswordAuthentication(final String _username, final String _password) {
    this.username = _username;
    this.password = _password;
  }
  
  @Override
  protected PasswordAuthentication getPasswordAuthentication() {
    return new PasswordAuthentication(this.username, this.password);
  }
}
