dominoPizzaApp.controller("AddIngredienteCtrl", function ($state,
  $stateParams,
  DistribucionesService,
  IngredienteService,
  PizzaService,
  TamanioService,
  PedidoService) {


  var self = this;
  var nombre = sessionStorage.getItem("Nombre");
  document.getElementById("userName").innerHTML = nombre;

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
      self.ingredientesDisponibles = _.reject(ingredientes, function(ingrediente){
        return self.pizza.tieneIngrediente(ingrediente);
      });
    });
  };

  this.distros = {};

  this.setDistros = function(){
    DistribucionesService.getDistribuciones().then(function(distros){
      self.distros = distros;
    });
  };


  this.setDistros();
  this.setPizza();
  this.setTamanio();
  this.setIngredientes();
  console.log(JSON.stringify(self.ingredientesDisponibles));

  this.agregar = function (ingred) {

    self.plato.extras.push(ingred);
    self.ingredientesDisponibles = _.without(self.ingredientesDisponibles, ingred);
  };

  this.eliminarIngrediente = function(ingred){
    self.plato.extras = _.without(self.plato.extras,ingred);
    self.ingredientesDisponibles.push(ingred);
  };

  this.generarPedido = function () {
    sessionStorage.setItem('Plato', angular.toJson(self.plato));
    $state.go("confirmarPedido");
  };
  

  this.setDistribucion = function(ingrediente,distribucion){
    ingrediente.distribucionElegida = distribucion;
  };

});
