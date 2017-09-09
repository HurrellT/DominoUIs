# DominoUIs
Repositorio para los proyectos de Construccion de Interfaces de Usuario - UNQ

Colaboradores:
- Tomas Hurrell
- Luca Hazuca
- Henry Borda
- Brian Goldman

TODO:
- Completar el Observer de Pedidos que notifica:
  1) Cuando el Pedido esta EnViaje HECHO
  2) Cuando tarda mas de 30 min en entregarse
- Crear el historial de Pedidos
- La clase DominoPizza no deberia tener el Menu?
- El Observer de los pedidos es DominoPizza, no el Cliente 
  1) Hasta ahora el ServicioDeNotificacion observa a Pedido. ¿Tendriamos que hacer que el DominoPizza tenga el servicio incorporado o que sea externo como es actualmente?
- El tiempo del Pedido se calcula guardando las fechas de creacion y de llegada del pedido
- Sacar todos los instance of
- Verificar que le llega la notificacion al cliente HECHO
- Sacar el if para el notifyObservers (si no me equivoco ya esta HECHO)
