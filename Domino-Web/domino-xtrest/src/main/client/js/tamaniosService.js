dominoPizzaApp.service("TamanioService", function () {

    this.tamanios = [
        {
            "id": 1,
            "name": "Una porción",
            "price": "$12,5"
        },
        {
            "id": 2,
            "name": "Grande",
            "price": "$50"
        },
        {
            "id": 3,
            "name": "Chica",
            "price": "$100"
        },
        {
            "id": 4,
            "name": "Familiar",
            "price": "$125"
        }
    ];

    this.getTamanioById = function (id) {
        return this.tamanios.find(function (tamanio) {
            return tamanio.id == id;
        })
    };

});