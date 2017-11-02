dominoPizzaApp.service("PizzaService", function ($http) {

	var getData = function(response) { return response.data }
    var transform = function(json) { return new Pizza(json) }

	return {
        
        getPizzas: function(errorHandler) { 
			return $http.get("http://localhost:9000/promos")
			.then(getData)
			.then(function(listaJson){ 
                return listaJson.map(transform) 
            })
			.catch(errorHandler) },
    };

	//  this.getPizzaById = function (id) {
    // return this.platos.find(function (pizza) {
    //   return pizza.id == id;
   	//  })
  	// };

	// this.platos =[  
	// {
	// 	"id": 1,
	// 	"nombre": "Muzzarella",
	// 	"precio": 125,
	// 	"ingredientes": [
	// 	{
	// 		"id": 2,
	// 		"nombre": "Queso",
	// 		"precio": 20,
	// 		"distribucionElegida": "Mitad Izquierda"
	// 	},
	// 	{
	// 		"id": 1,
	// 		"nombre": "Jamon",
	// 		"precio": 15,
	// 		"distribucionElegida": "Mitad derecha"
	// 	}
	// 	],
	// 	"extras":[]  
	// },
	// {
	// 	"id": 2,
	// 	"nombre": "Napolitana",
	// 	"precio": 125,
	// 	"ingredientes": [
	// 	{
	// 		"id": 2,
	// 		"nombre": "Queso",
	// 		"precio": 20,
	// 		"distribucionElegida": "Mitad Izquierda"
	// 	},
	// 	{
	// 		"id": 1,
	// 		"nombre": "Jamon",
	// 		"precio": 15,
	// 		"distribucionElegida": "Mitad derecha"
	// 	}
	// 	],
	// 	"extras":[]
	// },
	// {
	// 	"id": 3,
	// 	"nombre": "Custom",
	// 	"precio": 70,
	// 	"ingredientes": [],
	// 	"extras":[]
	// }
	// ];

});