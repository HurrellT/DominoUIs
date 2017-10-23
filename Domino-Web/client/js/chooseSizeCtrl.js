dominoPizzaApp.controller('ChooseSizeCtrl', function($stateParams, PizzaService, TamanioService){
	
	this.pizza = PizzaService.getPizzaById($stateParams.id);
	this.sizes = TamanioService.tamanios;

});