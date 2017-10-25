dominoPizzaApp.controller("AddIngredienteCtrl", function ($state,
                                                          $stateParams,
                                                          DistribucionesService,
                                                          IngredienteService,
                                                          PizzaService,
                                                          TamanioService,
                                                          PedidoService) {

    this.pizza = PizzaService.getPizzaById($stateParams.idP);
    this.ingredientes = IngredienteService.ingredientes;
    this.distros = DistribucionesService.distribuciones;
    this.tamanio = TamanioService.getTamanioById($stateParams.idT);

    var nombre = sessionStorage.getItem("Nombre");
	document.getElementById("userName").innerHTML = nombre;

    this.agregar = function (ingred) {
        this.pizza.extras.push(ingred);
    };

    this.generarPedido = function () {
        // window.alert("En proceso");
        $state.go("confirmarPedido({idP:this.pizza.id, idT:this.tamanio.id})")
    };
});
