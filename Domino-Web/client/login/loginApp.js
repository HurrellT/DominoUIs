'use strict';

var app = angular.module('loginModule', []);

app.controller('LoginCtrl', function () {

    this.nombre = ''
    this.password = ''

    this.send = function() {
        this.nombre = 'Nombre de prueba'
        this.password = 'password12345'
        //Aca hay que hacer un request al server con los datos del login
    };
    
});