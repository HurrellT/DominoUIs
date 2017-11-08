dominoPizzaApp.controller("AddIngredienteCtrl", function ($state,
                                                          $stateParams,
                                                          DistribucionesService,
                                                          IngredienteService,
                                                          PizzaService,
                                                          TamanioService,
                                                          PedidoService) {


  var self = this;

  this.plato = JSON.parse(sessionStorage.getItem('Plato'));
  this.tamanio = {};

  this.setTamanio = function(){
    TamanioService.getTamanioById(self.plato.id_tamanio).then(function(data){
      self.tamanio = data;
    });
  };

  this.pizza = {};

  this.setPizza = function(){
    PizzaService.getPizzaById(self.plato.id_promo).then(function(pizza){
      self.pizza = pizza;
    });
  };
  
  this.ingredientesDisponibles = {};

    this.setIngredientes = function(){
    IngredienteService.getIngredientes().then(function(ingredientes){
      self.ingredientesDisponibles = ingredientes;
    });
  };

  this.distros = {};

    this.setDistros = function(){
    DistribucionesService.getDistribuciones().then(function(distros){
      self.distros = distros;
    });
  };


  this.setDistros();
  this.setIngredientes();
  this.setPizza();
  this.setTamanio();

  this.agregar = function (ingred) {
    this.pizza.extras.push(ingred);
  };

  this.generarPedido = function () {
    $state.go("confirmarPedido({idP:this.pizza.id, idT:this.tamanio.id})");
  };

});
