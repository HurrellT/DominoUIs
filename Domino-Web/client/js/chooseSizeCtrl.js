dominoPizzaApp.controller('ChooseSizeCtrl', function($stateParams, PizzaService, TamanioService){
	
	this.pizza = PizzaService.getPizzaById($stateParams.id);
	this.sizes = TamanioService.tamanios;

	var nombre = sessionStorage.getItem("Nombre");
	document.getElementById("userName").innerHTML = nombre;

});