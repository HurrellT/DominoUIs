dominoPizzaApp.controller('ChooseSizeCtrl', function($stateParams, PizzaService, TamanioService){
	
	var self = this;

	this.pizza = {};
	this.setPizza = function(){
		PizzaService.getPizzaById($stateParams.id).then(function(pizza){
			self.pizza = pizza;
		});
	};

	this.setPizza();
	console.log(this.pizza);
	this.sizes = TamanioService.tamanios;

	var nombre = sessionStorage.getItem("Nombre");
	document.getElementById("userName").innerHTML = nombre;

});