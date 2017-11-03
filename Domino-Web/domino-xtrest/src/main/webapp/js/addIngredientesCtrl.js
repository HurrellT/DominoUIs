dominoPizzaApp.controller("AddIngredienteCtrl", function ($state,
                                                          $stateParams,
                                                          DistribucionesService,
                                                          IngredienteService,
                                                          PizzaService,
                                                          TamanioService,
                                                          PedidoService) {

  this.plato = JSON.parse(sessionStorage.getItem('Plato'));

  this.pizza = PizzaService.getPizzaById(plato.id_promo);

  var ingaux = this.pizza.ingredientes.map(function(i){return i.id;})
                                      .concat(this.pizza.extras.map(function(i){return i.id;}));

  this.ingredientesDisponibles = IngredienteService.getIngredientes().filter(yaEstaEnLaPizza);

  this.distros = DistribucionesService.getDistribuciones();

  this.tamanio = TamanioService.getTamanioById($stateParams.idT);

  //Queda seguir a partir de aca
  
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

  var self = this;

  var ingredientes = [];

  this.actualizarIngredientes = function(){
    IngredienteService.getIndredientes().then(function(data){
      self.ingredientes = data;
    });
  };
});
