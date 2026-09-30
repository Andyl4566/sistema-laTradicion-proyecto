# CP-01 – Registro y consulta de ventas

## Objetivo
Verificar que las ventas registradas en la base de datos se encuentren
correctamente relacionadas con el cliente, empleado y producto vendido.

## Tablas involucradas
- venta
- producto_venta
- producto
- cliente
- empleado

## Procedimiento
Se realizó una consulta utilizando INNER JOIN para relacionar la información
de la venta con el cliente, empleado y producto correspondiente.

## Resultado esperado
La consulta debe mostrar cada venta junto con:
- Cliente
- Empleado
- Producto
- Cantidad
- Precio unitario
- Monto de la venta

## Resultado obtenido
La consulta mostró correctamente las ventas registradas y sus relaciones.

Como evidencia, la venta No. 50 mostró:
- Cliente: Cliente Prueba 45
- Empleado: Empleado Prueba 47
- Producto: Tostada Tradicional 10 Uni.
- Cantidad: 1
- Precio unitario: Q8.00
- Monto: Q8.00

## Estado
APROBADO
