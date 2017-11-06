dominoPizzaApp.controller("AddIngredienteCtrl", function ($state,
                                                          $stateParams,
                                                          DistribucionesService,
                                                          IngredienteService,
                                                          PizzaService,
                                                          TamanioService,
                                                          PedidoService) {


  var self = this;

  this.plato = JSON.parse(sessionStorage.getItem('Plato'));

  this.pizza = {};

  this.setPizza = function(){
    PizzaService.getPizzaById(self.plato.id_promo).then(function(pizza){
      self.pizza = pizza;
    });
  };
  
  var ingaux = {};

  this.ingredientesDisponibles = {};

    this.setIngredientes = function(){
    IngredienteService.getIngredientes().then(function(ingredientes){
      self.ingredientesDisponibles = ingredientes;
    });
  };

  this.distros ={};

    this.setDistros = function(){
    DistribucionesService.getDistribuciones().then(function(distros){
      self.distros = distros;
    });
  };
  this.setDistros();
  this.setIngredientes();
  this.setPizza();
  var nombre = sessionStorage.getItem("Nombre");
  document.getElementById("userName").innerHTML = nombre;

  this.agregar = function (ingred) {
    this.pizza.extras.push(ingred);
  };

  this.generarPedido = function () {
    $state.go("confirmarPedido({idP:this.pizza.id, idT:this.tamanio.id})");
  };

});
