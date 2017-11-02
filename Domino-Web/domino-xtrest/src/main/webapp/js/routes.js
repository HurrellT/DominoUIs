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
        .state('editarUsuario', {
            url: "/editUser",
            templateUrl: "partials/editUser.html"
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
            url: "/addIngredient/:idP/:idT",
            templateUrl: "partials/addIngredients.html"
        })
        .state('confirmarPedido', {
            url: "/confirmOrder/:idP/:idT",
            templateUrl: "partials/confirmOrder.html"
        });

    $urlRouterProvider.otherwise("/login");

});