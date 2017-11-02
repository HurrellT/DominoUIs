dominoPizzaApp.controller("EditarUsuarioCtrl" , function(UsuarioService){
	
	
	this.usuario= UsuarioService.usuarioSesion;
	console.log(this.usuario);
});