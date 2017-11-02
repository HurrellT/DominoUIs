
dominoPizzaApp.controller('RegisterCtrl', function ($rootScope, $state, UsuarioService) {

    this.nickname = '';
    this.password1 = '';
    this.password2 = '';
    this.username = '';
    this.email = '';
    this.adress = '';

    this.confirm = function() {
        //Aca hay que hacer un request al server con los datos del register
        if(this.password1 == this.password2){
            UsuarioService.addUser(this.nickname, this.password1, this.username, this.email, this.adress);
            $rootScope.usuario = UsuarioService.getUsuarioByName(this.nickname);
            sessionStorage.setItem("Nombre", this.nickname);
            $state.go("crearPedido");
        }else{
            window.alert("Comproba tu contraseña");
        }
    };

    this.guest = function() {
        //Aca hay que registrarse como invitado
    };
    
});