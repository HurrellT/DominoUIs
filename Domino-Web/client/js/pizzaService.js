
dominoPizzaApp.service("PizzaService", function () {
	this.pizzas =[	
	{
		"id": 1,
		"nombre": "Muzzarella",
		"precio": 125,
		"ingredientes": [
		{
			"id": 2,
			"nombre": "Queso",
			"precio": 20,
			"distribucionElegida": "Mitad Izquierda"
		},
		{
			"id": 1,
			"nombre": "Jamon",
			"precio": 15,
			"distribucionElegida": "Mitad derecha"
		}
		],
		"extras":[]
	},
	{
		"id": 2,
		"nombre": "Napolitana",
		"precio": 125,
		"ingredientes": [
		{
			"id": 2,
			"nombre": "Queso",
			"precio": 20,
			"distribucionElegida": "Mitad Izquierda"
		},
		{
			"id": 1,
			"nombre": "Jamon",
			"precio": 15,
			"distribucionElegida": "Mitad derecha"
		}
		],
		"extras":[]
	},
	{
		"id": 3,
		"nombre": "Custom",
		"precio": 70,
		"ingredientes": [],
		"extras":[]
	}
	];
	this.pizza = '';

	this.pizzaPedido = function(pizza){
		this.pizza = pizza;
	}
});