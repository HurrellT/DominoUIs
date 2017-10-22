dominoPizzaApp.service("TamanioService",function(){

	
	this.tamanios = [
	{
		"name": "Una porción",
		"price": "$12,5"
	},
	{
		"name": "Grande",
		"price": "$50"
	},
	{
		"name": "Chica",
		"price": "$100"
	},
	{
		"name": "Familiar",
		"price": "$125"
	}
	];

	this.tamanio = '';
	
	this.tamanioPedido= function(tamanio){
		this.tamanio = tamanio;
	}
	
});