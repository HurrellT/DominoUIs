dominoPizzaApp.service("DistribucionesService", function($http){

	var getData = function(response) { return response.data }
	var transform = function(json) { return new Distribucion(json) }

	return {

		getDistribuciones: function() { 
			return $http.get("http://localhost:9000/distribuciones") //TODO: Hacer el GET
			.then(getData)
			.then(function(listaJson){
				return transform(listaJson);
			});
		},
	};

});