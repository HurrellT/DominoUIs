package org.domino.dominio;

import java.util.Observable;
import java.util.Observer;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.domino.dominio.Pedido;
import org.domino.dominio.UserPasswordAuthentication;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class ServicioDeNotificacion implements Observer {
  private UserPasswordAuthentication authentication;
  
  private boolean comprobanteDeMailEnviado;
  
  public ServicioDeNotificacion(final String usuario, final String contrasenia) {
    UserPasswordAuthentication _userPasswordAuthentication = new UserPasswordAuthentication(usuario, contrasenia);
    this.authentication = _userPasswordAuthentication;
    this.comprobanteDeMailEnviado = false;
  }
  
  private static ServicioDeNotificacion instance;
  
  public static ServicioDeNotificacion instance() {
    return ServicioDeNotificacion.instance;
  }
  
  public static ServicioDeNotificacion config(final ServicioDeNotificacion sender) {
    return ServicioDeNotificacion.instance = sender;
  }
  
  public void sendMail(final String para, final String asunto, final String cuerpo) {
    try {
      try {
        this.comprobanteDeMailEnviado = true;
        Session _createSession = this.createSession();
        final MimeMessage message = new MimeMessage(_createSession);
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(para));
        message.setSubject(asunto);
        message.setText(cuerpo);
        Transport.send(message);
      } catch (final Throwable _t) {
        if (_t instanceof MessagingException) {
          final MessagingException exception = (MessagingException)_t;
          this.comprobanteDeMailEnviado = false;
          exception.printStackTrace();
          throw exception;
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  private Session createSession() {
    Session _xblockexpression = null;
    {
      Properties _properties = new Properties();
      final Procedure1<Properties> _function = (Properties it) -> {
        it.put("mail.smtp.auth", "true");
        it.put("mail.smtp.starttls.enable", "true");
        it.put("mail.smtp.host", "smtp.gmail.com");
        it.put("mail.smtp.port", "587");
        it.put("mail.smtp.ssl.trust", "smtp.gmail.com");
      };
      final Properties props = ObjectExtensions.<Properties>operator_doubleArrow(_properties, _function);
      _xblockexpression = Session.getInstance(props, this.authentication);
    }
    return _xblockexpression;
  }
  
  @Override
  public void update(final Observable o, final Object arg) {
    final Pedido pedido = ((Pedido) o);
    ServicioDeNotificacion.instance.sendMail(pedido.getCliente().getEmail(), "Test", "Test");
  }
  
  @Pure
  public UserPasswordAuthentication getAuthentication() {
    return this.authentication;
  }
  
  public void setAuthentication(final UserPasswordAuthentication authentication) {
    this.authentication = authentication;
  }
  
  @Pure
  public boolean isComprobanteDeMailEnviado() {
    return this.comprobanteDeMailEnviado;
  }
  
  public void setComprobanteDeMailEnviado(final boolean comprobanteDeMailEnviado) {
    this.comprobanteDeMailEnviado = comprobanteDeMailEnviado;
  }
}
