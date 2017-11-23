
dominoPizzaApp.controller("ConfirmarPedidoCtrl", function ($state, PedidoService) {

    var self = this;

    this.tipo = " ";

    this.direccion = " ";

    this.aclaracion = " ";

    self.platoTerminado = new Plato(JSON.parse(sessionStorage.getItem("Plato")));

    this.pedido = PedidoService.pedidoBase;

    this.agregarPlato = function(){
        PedidoService.agregarPlato(self.platoTerminado);
        $state.go("crearPedido");
    };

    this.confirmar = function() {
        PedidoService.terminarPedido(self.platoTerminado, self.tipo, self.direccion, self.aclaracion);
        PedidoService.enviarPedido(errorHandler, function() { $state.go("editarUsuario"); });
        
    };

    this.setRetiro = function() {
        self.tipo = 'retiro';
    };


    this.setDelivery = function() {
        self.tipo = 'delivery';
        self.direccion = self.direccion;
    };

    function errorHandler(error) {
        //self.notificarError(error.data);
        }

	var nombre = sessionStorage.getItem("Nombre");
	document.getElementById("userName").innerHTML = nombre;
});
