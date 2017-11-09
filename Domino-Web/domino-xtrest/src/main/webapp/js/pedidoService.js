dominoPizzaApp.service("PedidoService", function($http) {

var self = this;

this.pedidoBase = { "platos": [],
					"aclaraciones": " ",
					"id_usuario": sessionStorage.getItem("Nombre"),
					"entrega": { "tipo": " ", "direccion": " "}}; 

return {
			enviarPedido: function(error, cb) { 
				return $http.post("http://localhost:9000/pedidos", self.pedidoBase)
				.then(cb)
				.catch(error);
			},
			
			agregarPlato: function(plato) {
				self.pedidoBase.platos.push(plato);
				console.log(self.pedidoBase);
			},

			terminarPedido: function(plato, entrega, direccion, aclaracion){
				self.pedidoBase.platos.push(plato);
				self.pedidoBase.entrega.tipo = entrega;
				self.pedidoBase.entrega.direccion = direccion;
				self.pedidoBase.aclaraciones = aclaracion
			}
		};
});