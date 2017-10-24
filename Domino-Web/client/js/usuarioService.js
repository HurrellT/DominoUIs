dominoPizzaApp.service("UsuarioService", function () {

    this.usuarios = [
        {
            "id": 1,
            "usuario": "lucakapo",
            "password": "alsjdnas",
            "nombre": "Luca",
            "email": "luka@gmail.com",
            "direccion": "calle 28"
        },
        {
            "id": 2,
            "usuario": "admin",
            "password": "admin",
            "nombre": "Admin",
            "email": "admin@gmail.com",
            "direccion": "calle administrativa"
        }
    ];

    this.getUsuarioByName = function (name) {
        return this.usuarios.find(function (usuario) {
            return usuario.usuario == name;
        })
    }

});