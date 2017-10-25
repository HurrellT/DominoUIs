dominoPizzaApp.controller('LoginCtrl', function ($rootScope, $state, UsuarioService) {

    this.nombre = '';
    this.password = '';

    this.acceder = function() {
    	if(UsuarioService.hasUser(this.nombre, this.password)){
    		$rootScope.usuario = UsuarioService.getUsuarioByName(this.nombre); //Will be validateLogin from Server
    		$state.go("crearPedido");
    	}else{
    		window.alert("Nombre de usuario o contraseña incorrectos");
    	}
        //Aca hay que hacer un request al server con los datos del login
    };
    
});