" use strict ";

var app = angular.module("addIngredientesModule", []);

app.controller("AddIngredienteCtrl" , function($scope) {
	$scope.ingredientes = [
	{
		"id": 1,
		"nombre": "Jamon",
		"precio": 15,
		"distribucionElegida": "Mitad derecha"
	},
	{
		"id": 2,
		"nombre": "Queso",
		"precio": 20,
		"distribucionElegida": "Mitad Izquierda"
	},
	{
		"id": 3,
		"nombre": "Anchoas",
		"precio": 50,
		"distribucionElegida": "Mitad derecha"
	},
	{
		"id": 4,
		"nombre": "Aceitunas",
		"precio": 15,
		"distribucionElegida": "Toda la pizza"
	},
	{
		"id": 5,
		"nombre": "Salchichas",
		"precio": 35,
		"distribucionElegida": "Toda la pizza"
	}
	];

	this.agregar = function(ingred){
		console.log(ingred);
		$scope.promo.extras.push(ingred);
	};

	$scope.distros = [ "Mitad derecha",
	"Toda la pizza",
	"Mitad Izquierda"
	];

	$scope.promo =    
	{
		"id": 1,
		"nombre": "Muzzarella",
		"precio": 125,
		"ingredientes": [
		{
			"id": 2,
			"nombre": "Queso",
			"precio": 20,
			"distribucionElegida": "Mitad Izquierda"
		},
		{
			"id": 1,
			"nombre": "Jamon",
			"precio": 15,
			"distribucionElegida": "Mitad derecha"
		}
		],
		"extras":[]
	};
});
