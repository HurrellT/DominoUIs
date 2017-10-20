
dominoPizzaApp.controller('LoginCtrl', function ($state) {

    this.nombre = '';
    this.password = '';

    this.acceder = function() {
    	if(this.nombre == "admin" && this.password == "admin"){
    		$state.go("crearPedido");
    	}else{
    		window.alert("Nombre de usuario y contraseña incorrectos");
    	}
        //Aca hay que hacer un request al server con los datos del login
    };
    
});	