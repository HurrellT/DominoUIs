
dominoPizzaApp.controller("ConfirmarPedidoCtrl", function ($stateParams,
                                                           PizzaService,
                                                           TamanioService,
                                                           EstadosService) {

    this.pizza      = PizzaService.getPizzaById($stateParams.idP);
    this.tamanio    = TamanioService.getTamanioById($stateParams.idT);
    this.pedidos    = new Pedido(EstadosService);

});
