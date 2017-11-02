dominoPizzaApp.controller('LoginCtrl', function ($resource, $rootScope, $state, UsuarioService) {

  var self = this;

  self.name = '';
  self.password = '';

  function errorHandler(error) {
    //self.notificarError(error.data);
}

  this.acceder = function() {
    UsuarioService.login(self.name, self.password, self.errorHandler)
    .then(function(name) {
        $state.go("crearPedido");
        console.log("Ok");
        sessionStorage.setItem("Nombre", name);
    })
    .catch(errorHandler);
}

//    if(UsuarioService.login(this.nombre, this.password)){
//       UsuarioService.setUser(this.nombre);
//       $state.go("crearPedido");
//   }else{
//       window.alert("Nombre de usuario o contraseña incorrectos");
//   }
//         //Aca hay que hacer un request al server con los datos del login
//     };
    

    
    
});