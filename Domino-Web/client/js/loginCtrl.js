dominoPizzaApp.controller('LoginCtrl', function ($rootScope, $state, UsuarioService) {

  this.nombre = '';
  this.password = '';

  this.acceder = function() {
   if(UsuarioService.login(this.nombre, this.password)){
      UsuarioService.setUser(this.nombre);
      $state.go("crearPedido");
  }else{
      window.alert("Nombre de usuario o contraseña incorrectos");
  }
        //Aca hay que hacer un request al server con los datos del login
    };
    

    
    
});