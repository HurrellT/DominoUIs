dominoPizzaApp.service("UsuarioService", function () {
    this.usuarioSesion="";

    this.usuarios = [
        {
            "id": 1,
            "usuario": "admin",
            "password": "admin",
            "nombre": "Administrador",
            "email": "admin@gmail.com",
            "direccion": "calle administrativa"
        },
        {
            "id": 2,
            "usuario": "luca_hazuca",
            "password": "luca123",
            "nombre": "Luca",
            "email": "luca@gmail.com",
            "direccion": "calle 1"
        },
        {
            "id": 3,
            "usuario": "henry_borda",
            "password": "henry123",
            "nombre": "Henry",
            "email": "henry@gmail.com",
            "direccion": "calle 2"
        }
    ];

    this.getUsuarioByName = function (name) {
        return this.usuarios.find(function (usuario) {
            return usuario.usuario == name;
        });
    };

    this.login = function (name, password) {
        if(this.usuarios.some(elem => elem.usuario == name && elem.password == password)){
            return true;
        }else{
            return false;
        }
    };

    this.setUser= function(name){
        this.usuarioSesion=name;
    };
    this.addUser = function (nickname, password, username, email, adress) {
        newUser = { "id": 4, "usuario": nickname, "password": password, "nombre": username, "email": email, "direccion": adress};
        this.usuarios.push(newUser);    
    }

});