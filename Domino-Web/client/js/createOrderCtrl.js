dominoPizzaApp.controller("CreateOrderCtrl", function($state,PizzaService){
	this.pizzas = PizzaService.pizzas;

	this.confirmarPizza = function (pizza){
		PizzaService.pizzaPedido(pizza);
		$state.go("elegirTamaño");
	}
});