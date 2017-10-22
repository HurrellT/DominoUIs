
dominoPizzaApp.controller("AddIngredienteCtrl" , function($scope) {

	this.agregar = function(ingred,promo){
		console.log(ingred);
		promo.extras.push(ingred);
	};
});
