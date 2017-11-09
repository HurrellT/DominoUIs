dominoPizzaApp.controller("EditarUsuarioCtrl" , function(UsuarioService){
	
	var self = this;
	
	self.usuario= {}

	var nombre = sessionStorage.getItem("Nombre");
	document.getElementById("userName").innerHTML = nombre;
	

	function errorHandler(error) {
		//self.notificarError(error.data);
		}
	

	this.setUsuario = function(){
		UsuarioService.getUsuarioByUsername(sessionStorage.getItem("Nombre")).then(function(usuario){
			self.usuario = usuario;
		});
	};

	this.setUsuario();

	self.actualizarDatos = function(){
		UsuarioService.actualizarDatos(self.usuario.usuario,self.usuario, errorHandler)
	}
});