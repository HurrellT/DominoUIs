dominoPizzaApp.controller('LoginCtrl', function ($resource, $rootScope, $state, UsuarioService) {

  var self = this;

  self.name = '';
  self.password = '';

  function errorHandler(error) {
    //self.notificarError(error.data);
}

  this.acceder = function() {
    UsuarioService.login(self.name, self.password, self.errorHandler)
    .then(function() {
        console.log("Has accedido a Domino Pizza");
        sessionStorage.setItem("Nombre", self.name);
        $state.go("crearPedido");
    })
    .catch(errorHandler);
}
    
});