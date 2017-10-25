dominoPizzaApp.controller("CreateOrderCtrl", function($rootScope, PizzaService){
	this.platos = PizzaService.platos;

	var nombre = sessionStorage.getItem("Nombre");
	document.getElementById("user").innerHTML = nombre;

});