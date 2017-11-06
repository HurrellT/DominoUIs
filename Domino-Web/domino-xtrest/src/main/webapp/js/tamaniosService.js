dominoPizzaApp.service("TamanioService", function ($http) {

    var getData = function(response) { return response.data }
    var transform = function(json) { return new Tamanio(json) }

    return {
        getTamanios: function() { 
            return $http.get("http://localhost:9000/tamanios")
            .then(getData)
            .then(function(listaJson){ 
                return listaJson.map(transform); 
            });
        },
        getTamanioById : function (id){
            return $http.get("http://localhost:9000/tamanios/" + id) //TODO: Hacer el GET
            .then(getData)
            .then(function(dataTamanio){
                return transform(dataTamanio);
            });
        }
    };

    // this.tamanios = [
    //     {
    //         "id": 1,
    //         "name": "Una porción",
    //         "price": "$12,5"
    //     },
    //     {
    //         "id": 2,
    //         "name": "Grande",
    //         "price": "$50"
    //     },
    //     {
    //         "id": 3,
    //         "name": "Chica",
    //         "price": "$100"
    //     },
    //     {
    //         "id": 4,
    //         "name": "Familiar",
    //         "price": "$125"
    //     }
    // ];

    // this.getTamanioById = function (id) {
    //     return this.tamanios.find(function (tamanio) {
    //         return tamanio.id == id;
    //     })
    // };

});