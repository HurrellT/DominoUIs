
dominoPizzaApp.controller('RegisterCtrl', function ($state) {

    this.nickname = '';
    this.password1 = '';
    this.password2 = '';
    this.username = '';
    this.email = '';
    this.adress = '';

    this.confirm = function() {
        //Aca hay que hacer un request al server con los datos del register
        if(password1 == password2){
        $state.go("crearPedido");
    }
    };

    this.guest = function() {
        //Aca hay que registrarse como invitado
    };
    
});