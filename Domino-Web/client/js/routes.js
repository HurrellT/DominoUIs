dominoPizzaApp.config(function ($stateProvider, $urlRouterProvider) {

  $stateProvider
    .state('login', {
      url: "/login",
      templateUrl: "partials/login.html"
    })
    .state('register', {
      url: "/register",
      templateUrl: "partials/register.html"
    })
    .state("crearPedido", {
      url: "/create",
      templateUrl: "partials/createOrder.html"
    })
    .state('elegirTamaño', {
      url: "/chooseSize",
      templateUrl: "partials/chooseSize.html"
    })
    .state('agregarIngrediente', {
      url: "/addIngredient",
      templateUrl: "partials/addIngredients.html"
    });

    $urlRouterProvider.otherwise("/login");

});