dominoPizzaApp.controller('ChooseSizeCtrl', function($state, PizzaService, TamanioService){
	
	var self = this;

	this.plato = JSON.parse(sessionStorage.getItem('Plato'));
	this.pizza = {};
	this.setPizza = function(){
		PizzaService.getPizzaById(self.plato.id).then(function(pizza){
			self.pizza = pizza;
		});
	};

	this.setPizza();
	console.log(this.pizza);
	this.sizes = TamanioService.tamanios;

	var nombre = sessionStorage.getItem("Nombre");
	document.getElementById("userName").innerHTML = nombre;

	this.seleccionarTamanio = function(tamanio){
		self.plato.id_tamanio=tamanio.id;
		sessionStorage.setItem('Plato',JSON.stringify(self.plato));
		$state.go("agregarIngrediente");
	};

});