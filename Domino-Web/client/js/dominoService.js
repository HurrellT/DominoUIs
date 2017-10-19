
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

	this.ingredientes = [
	{
		"id": 1,
		"nombre": "Jamon",
		"precio": 15,
		"distribucionElegida": "Derecha"
	},
	{
		"id": 2,
		"nombre": "Queso",
		"precio": 20,
		"distribucionElegida": "Izquierda"
	},
	{
		"id": 3,
		"nombre": "Anchoas",
		"precio": 50,
		"distribucionElegida": "Derecha"
	},
	{
		"id": 4,
		"nombre": "Aceitunas",
		"precio": 15,
		"distribucionElegida": "Toda la pizza"
	},
	{
		"id": 5,
		"nombre": "Salchichas",
		"precio": 35,
		"distribucionElegida": "Toda la pizza"
	}
	];

	this.pedidos = [
	{
		"id": 1,
		"estado": "preparando",
		"monto": 140,
		"pizzas": [
		{
			"id_promo": 1,
			"id_tamanio": 2,
			"extras": []
		}
		],
		"id_usuario": 1,
		"aclaraciones": "Primer pedido",
		"entrega": {
			"tipo": "delivery",
			"direccion": "calle 28"
		}
	},
	{
		"id": 2,
		"estado": "preparando",
		"monto": 170,
		"pizzas": [
		{
			"id_promo": 2,
			"id_tamanio": 3,
			"extras": []
		}
		],
		"id_usuario": 2,
		"aclaraciones": "Segundo pedido",
		"entrega": {
			"tipo": "retiro",
			"direccion": null
		}
	}
	];

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


	this.distros = [ "Mitad derecha",
	"Toda la pizza",
	"Mitad Izquierda"
	];
});