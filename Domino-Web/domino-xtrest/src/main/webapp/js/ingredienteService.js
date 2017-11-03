dominoPizzaApp.service("IngredienteService", function () {

	var getData = function(response) { return response.data }
	var transform = function(json) { return new Plato(json) }

	return {

		getIngredientes: function() { 
			return $http.get("http://localhost:9000/ingredientes")
			.then(getData)
			.then(function(listaJson){ 
				return listaJson.map(transform); 
			});
		},
	};

// this.ingredientes = [
// 	{
// 		"id": 1,
// 		"nombre": "Jamon",
// 		"precio": 15,
// 		"distribucionElegida": "Derecha"
// 	},
// 	{
// 		"id": 2,
// 		"nombre": "Queso",
// 		"precio": 20,
// 		"distribucionElegida": "Izquierda"
// 	},
// 	{
// 		"id": 3,
// 		"nombre": "Anchoas",
// 		"precio": 50,
// 		"distribucionElegida": "Derecha"
// 	},
// 	{
// 		"id": 4,
// 		"nombre": "Aceitunas",
// 		"precio": 15,
// 		"distribucionElegida": "Toda la pizza"
// 	},
// 	{
// 		"id": 5,
// 		"nombre": "Salchichas",
// 		"precio": 35,
// 		"distribucionElegida": "Toda la pizza"
// 	}
// 	];
// });