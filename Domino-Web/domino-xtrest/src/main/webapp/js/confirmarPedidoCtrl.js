
dominoPizzaApp.controller("ConfirmarPedidoCtrl", function (PizzaService,
                                                           TamanioService,
                                                           EstadosService) {

    this.pizza      = {};
    this.tamanio    = {};
    this.pedido   = new Pedido(EstadosService);

	var nombre = sessionStorage.getItem("Nombre");
	document.getElementById("userName").innerHTML = nombre;
});
