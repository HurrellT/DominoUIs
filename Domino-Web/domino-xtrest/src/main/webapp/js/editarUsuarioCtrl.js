dominoPizzaApp.controller("EditarUsuarioCtrl" , function($state,UsuarioService, PedidoService){
	
	var self = this;
	
	self.usuario= {}

	this.pedidosUsuario = [];

	function errorHandler(error) {
		//self.notificarError(error.data);
		}

	this.setUsuario = function(){
		UsuarioService.getUsuarioByUsername(sessionStorage.getItem("Nombre")).then(function(usuario){
			self.usuario = usuario;
		});
	};
	
	this.actualizarPedidos = function(){
		PedidoService.pedidosDeUsuario(sessionStorage.getItem("Nombre")).then(function(data){
			self.pedidosUsuario = data;
		});
	};

	this.setUsuario();
	this.actualizarPedidos();

	self.actualizarDatos = function(){
		UsuarioService.actualizarDatos(self.usuario.usuario,self.usuario, errorHandler)
	};

	this.repetirPedido= function(pedido){
		PedidoService.setPedido(pedido);
		$state.go("confirmarPedido");
	}
});