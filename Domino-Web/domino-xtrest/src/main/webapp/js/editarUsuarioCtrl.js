dominoPizzaApp.controller("EditarUsuarioCtrl" , function(UsuarioService){
	
	var self = this;
	
	self.usuario= {}

	this.setUsuario = function(){
		UsuarioService.getUsuarioByUsername(sessionStorage.getItem("Nombre")).then(function(usuario){
			self.usuario = usuario;
		});
	};

	this.setUsuario();

	self.actualizarDatos = function(){
		UsuarioService.actualizarDatos(self.usuario.usuario,self.usuario)
	}
});