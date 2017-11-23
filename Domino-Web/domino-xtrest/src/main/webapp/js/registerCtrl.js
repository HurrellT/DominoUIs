
dominoPizzaApp.controller('RegisterCtrl', function ($state, UsuarioService) {

    var self = this;

    self.name = '';
    self.username = '';
    self.adress = '';
    self.email = '';
    self.password1 = '';
    self.password2 = '';

  function errorHandler(error) {
    //self.notificarError(error.data);
    }

  this.confirm = function() {
       UsuarioService.register(self.name, self.username, self.adress, self.email, self.password1, self.password2, self.errorHandler)
        .then(function() {
            console.log("Has accedido a Domino Pizza");
            sessionStorage.setItem("Nombre", self.username);
            $state.go("crearPedido");
        })
        .catch(errorHandler);
    };
  this.guest = function() {
        //Aca hay que registrarse como invitado
    };
});