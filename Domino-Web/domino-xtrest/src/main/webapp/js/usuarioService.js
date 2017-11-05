dominoPizzaApp.service("UsuarioService", function ($http) {
    // this.usuarioSesion="";

    return {
        
        login: function(name, password, errorHandler) { 
            this.infoLogin = { 
                "usuario": name, 
                "password": password,
              }
            return $http.post("http://localhost:9000/login", this.infoLogin).then(name).catch(errorHandler)
            },
    
        register: function(name,username,adress,email,password1,password2,errorHandler){
           if(password1==password2){
            this.infoRegister = {
                "usuario": username,
                "nombre": name,
                "password": password1,
                "password2": password2,
                "email": email,
                "adress": adress,
                } 
           
                return $http.post("http://localhost:9000/usuarios", this.infoRegister).then(name).catch(errorHandler)
           }
        alert("Revise las contraseñas");
       }
    };
    // this.setUser= function(name){
    //     this.usuarioSesion=name;
    // };
    
    // this.addUser = function (nickname, password, username, email, adress) {
    //     newUser = { "id": 4, "usuario": nickname, "password": password, "nombre": username, "email": email, "direccion": adress};
    //     this.usuarios.push(newUser);    
    // }

});