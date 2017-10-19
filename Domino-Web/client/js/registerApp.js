
dominoPizzaApp.controller('RegisterCtrl', function () {

    this.nickname = ''
    this.password1 = ''
    this.password2 = ''
    this.username = ''
    this.email = ''
    this.adress = ''

    this.confirm = function() {
        this.nickname = 'juancho2000'
        this.password1 = 'mipassword123'
        this.password2 = 'mipassword123'
        this.username = 'Juan Carlos'
        this.email = 'juancho@gmail.com'
        this.adress = 'Calle Copada 123'
        //Aca hay que hacer un request al server con los datos del register
    };

    this.guest = function() {
        //Aca hay que registrarse como invitado
    };
    
});