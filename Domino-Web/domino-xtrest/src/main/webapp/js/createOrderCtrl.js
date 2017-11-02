dominoPizzaApp.controller("CreateOrderCtrl", function(PizzaService, UsuarioService){
	this.platos = PizzaService.platos;

	this.nombre = UsuarioService.usuarioSesion;
	//console.log(this.nombre);
});