dominoPizzaApp.controller("AddIngredienteCtrl", function ($state,$stateParams,  DistribucionesService,  IngredienteService,  PizzaService,  TamanioService,  PedidoService) {

  this.pizza = PizzaService.getPizzaById($stateParams.idP);
  var ingaux = this.pizza.ingredientes.map(function(i){return i.id;}).concat(this.pizza.extras.map(function(i){return i.id;}));
  this.ingredientesDisponibles = IngredienteService.ingredientes.filter(yaEstaEnLaPizza);

  this.distros = DistribucionesService.distribuciones;
  this.tamanio = TamanioService.getTamanioById($stateParams.idT);


  var nombre = sessionStorage.getItem("Nombre");
  document.getElementById("userName").innerHTML = nombre;

  this.agregar = function (ingred) {
    this.pizza.extras.push(ingred);
  };

  this.generarPedido = function () {
    $state.go("confirmarPedido({idP:this.pizza.id, idT:this.tamanio.id})");
  };

  function yaEstaEnLaPizza (ingrediente){
    console.log(ingaux);
    return !_.includes(ingaux,ingrediente.id);
  }
});
