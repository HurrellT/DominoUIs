dominoPizzaApp.controller('ChooseSizeCtrl', function($state, PizzaService, TamanioService){
	
	var self = this;

	this.plato = JSON.parse(sessionStorage.getItem('Plato'));
	this.pizza = {};
	
	var sizes =[];

	this.setPizza = function(){
		PizzaService.getPizzaById(self.plato.id_promo).then(function(pizza){
			self.pizza = pizza;
		});
	};

	this.setPizza();

	this.actualizarTamanios = function(){
		TamanioService.getTamanios().then(function(data){
			self.sizes = data;
		});
	};

	self.actualizarTamanios();

	var nombre = sessionStorage.getItem("Nombre");
	document.getElementById("userName").innerHTML = nombre;

	this.seleccionarTamanio = function(tamanio){
		self.plato.id_tamanio= tamanio.nombre;
		sessionStorage.setItem('Plato',JSON.stringify(self.plato));
		$state.go("agregarIngrediente");
	};

});