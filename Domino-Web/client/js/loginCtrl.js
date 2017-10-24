dominoPizzaApp.controller('LoginCtrl', function ($scope, $state, UsuarioService) {

    this.nombre = '';
    this.password = '';

    this.acceder = function() {
    	if(this.nombre == "admin" && this.password == "admin"){
    		$scope.usuario = UsuarioService.getUsuarioByName(this.nombre); //Will be validateLogin from Server
    		$state.go("crearPedido");
    	}else{
    		window.alert("Nombre de usuario y contraseña incorrectos");
    	}
        //Aca hay que hacer un request al server con los datos del login
    };
    
});