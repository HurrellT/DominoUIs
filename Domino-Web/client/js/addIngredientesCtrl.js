
dominoPizzaApp.controller("AddIngredienteCtrl", function($stateParams, 
	DistribucionesService,
	IngredienteService, 
	PizzaService,
	TamanioService, 
	PedidoService) {

	this.pizza   = PizzaService.getPizzaById($stateParams.idP);
	this.ingredientes = IngredienteService.ingredientes;
	this.distros = DistribucionesService.distribuciones;
	this.tamanio = TamanioService.getTamanioById($stateParams.idT);

	this.agregar = function(ingred){
		this.pizza.extras.push(ingred);
	};

	this.generarPedido = function() {
		window.alert("TOMY HACE ESTO");
	};
});
