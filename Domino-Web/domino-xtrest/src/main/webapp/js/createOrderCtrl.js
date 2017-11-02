dominoPizzaApp.controller("CreateOrderCtrl", function(PizzaService, UsuarioService){
	
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

	//this.nombre = UsuarioService.usuarioSesion;
	//console.log(this.nombre);
});