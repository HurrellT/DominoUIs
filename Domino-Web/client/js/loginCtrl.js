dominoPizzaApp.controller('LoginCtrl', function ($rootScope, $state, UsuarioService) {

    this.nombre = '';
    this.password = '';

    this.acceder = function() {
    	if(this.nombre == "admin" && this.password == "admin"){
    		$rootScope.usuario = UsuarioService.getUsuarioByName(this.nombre); //Will be validateLogin from Server
    		$state.go("crearPedido");
    	}else{
    		window.alert("Nombre de usuario y contraseña incorrectos");
    	}
        //Aca hay que hacer un request al server con los datos del login
    };
    
});