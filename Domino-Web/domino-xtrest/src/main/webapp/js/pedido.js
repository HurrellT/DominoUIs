var Pedido = function (EstadosService) {

    this.platos         = new Array([]);
    this.aclaraciones   = "";
    this.fecha          = new Date();
    this.estado         = EstadosService.estadoInicial;

}

this.agregarPlato = function (plato) {
    this.platos.push(plato);
}

this.cambiarAclaracion = function (aclaracionNueva) {
    this.aclaraciones = aclaracionNueva;
}