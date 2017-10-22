dominoPizzaApp.controller("ChooseSizeCtrl", function($state,TamanioService){

	this.sizes = TamanioService.tamanios;
	this.confirmarTamanio = function(tamanio){
		TamanioService.tamanioPedido(tamanio);
		$state.go("agregarIngrediente")
	}
});