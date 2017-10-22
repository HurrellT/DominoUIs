dominoPizzaApp.service("PedidoService", function() {

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
		]
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


});