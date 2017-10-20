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
    });

    $urlRouterProvider.otherwise("/login");

});