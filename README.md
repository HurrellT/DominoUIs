# DominoUIs
Repositorio para los proyectos de Construccion de Interfaces de Usuario - UNQ

### Colaboradores:
- Tomas Hurrell
- Luca Hazuca
- Henry Borda
- Brian Goldman



## Bugs

DOMINO PIZZA WINDOW
- Sigue tardando en actualizar los pedidos

EDITAR PEDIDO WINDOW
- No se actualizan los precios hasta aceptar la edicion de otro pedido
- Los enabled de los botones Editar y Eliminar un plato se anulan entre si: si solo dejas pedido.esAbierto, funciona solo para los  pedidos cerrados; si pones los tres enabled, funciona solo cuando el pedido es abierto 

CREAR PLATO WINDOW
- Bug retardado
- El precio mostrado no se actualiza (el precio de la pizza sumado al de los ingredientes) hasta cerrar la ventana y volver a abrirla
- Al agregar, se muestra un precio que no corresponde, ademas de que no se actualiza
- Si agregaste y cancelas, la pizza aparece igual, pero sin nombre
- PRECIO (influido por tamanio) esta MAL

EDITAR PLATO WINDOW
- Al agregar ingrediente, no se actualiza el precio (ESTO ES POR COMO ESTA IMPLEMENTADO MONTO TOTAL DEL PLATO!!!)

EDITAR PROMO WINDOW
- No aparece la distribucion solo cuando es "Toda la pizza" (problema con el String?)
- No se actualiza el precio al editar los ingredientes

MOSTRAR MENU WINDOW
- Bug retardado

PEDIDOS CERRADOS WINDOW


EDITAR INGREDIENTE WINDOW
- Bug retardado

AGREGAR INGREDIENTE WINDOW
- Bug retardado
