'use strict';

var app = angular.module('createOrderModule', []);

app.controller('CreateOrderCtrl', function($scope) {

    $scope.pizzas = [
        {
            "name" : "Muzzarella",
            "description" : "Muzzarella y aceitunas",
            "price" : "$75"
        },
        {
            "name" : "Jamon y morrones",
            "description" : "Jamon, morrones y aceitunas",
            "price" : "$100"
        },
        {
            "name" : "Provolone",
            "description" : "Provolone y jamón",
            "price" : "$130"
        },
        {
            "name" : "Armá tu pizza",
            "description" : "Con los ingredientes que más te gusten",
            "price" : "$70"
        }
    ]
    
});