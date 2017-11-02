dominoPizzaApp.service("PlatoService", function () {

    //TODO: revisar
    this.crearPlato = function (pizza, tamanio) {
        var plato = new Plato();
        plato.agregarPizza(pizza);
        plato.agregarTamanio(tamanio);

        return plato;
    }
})