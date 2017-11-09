dominoPizzaApp.service("PedidoService", function($http) {

var self = this;

var getData = function(response) { return response.data }
var transform = function(json) { return new Pedido(json) }
var self=this;

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
			},

			terminarPedido: function(plato, tipo, direccion, aclaracion){
				self.pedidoBase.platos.push(plato);
				self.pedidoBase.entrega.tipo = tipo;
				self.pedidoBase.entrega.direccion = direccion;
				self.pedidoBase.aclaraciones = aclaracion;
			},

			pedidosDeUsuario: function(username){
				return $http.get("http://localhost:9000/pedidos/usuarios/"+username)
				.then(getData)
				.then(function(listaJson){
					return transform(listaJson);
				} );
			},

			setPedido: function(pedido){
				self.pedidoBase.platos = pedido.platos; 
			}
		};
});