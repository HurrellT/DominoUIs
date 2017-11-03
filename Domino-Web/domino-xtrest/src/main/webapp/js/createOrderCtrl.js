dominoPizzaApp.controller("CreateOrderCtrl", function($state, PizzaService, UsuarioService){
	
	var self = this;

	var pizzas = [];

	this.plato = {
		"id_promo": null,
		"id_tamanio": null,
		"extras": []
	};

	this.actualizarPizzas = function(){
		PizzaService.getPizzas().then(function(data){
			self.pizzas = data;
		});
	};

	self.actualizarPizzas();

	this.choosePizza = function(id) {
		self.plato.id_promo = id;
		sessionStorage.setItem("Plato",JSON.stringify(self.plato));
		$state.go('elegirTamaño');
	};

});