# CP-02 – Control de stock insuficiente

## Objetivo

Verificar que la base de datos impida registrar la venta de una cantidad de
producto superior al stock disponible.

## Tablas involucradas

- `venta`
- `producto_venta`
- `producto`

## Datos utilizados

Se utilizó el producto:

- ID producto: 47
- Producto: Chiquitolina 5 Lb.
- Stock disponible antes de la prueba: 39 unidades
- Precio unitario: Q75.00
- Cantidad solicitada para la prueba: 40 unidades

La cantidad solicitada fue intencionalmente mayor al stock disponible.

## Procedimiento

Primero se inició una transacción y se creó una venta temporal con el
identificador 9999.

Posteriormente se intentó asociar a la venta 40 unidades del producto 47,
aunque solamente existían 39 unidades disponibles.

```sql
START TRANSACTION;

INSERT INTO venta (
    id_venta,
    asunto,
    fecha_venta,
    monto,
    id_empleado,
    id_cliente
)
VALUES (
    9999,
    'CP-02 Prueba stock insuficiente',
    '2026-09-20',
    3000.00,
    1,
    1
);

INSERT INTO producto_venta (
    id_venta,
    id_producto,
    cantidad,
    precio_unitario
)
VALUES (
    9999,
    47,
    40,
    75.00
);
# RESULTADO ESPERADO:
La base de datos debe impedir el registro del detalle de venta debido a que
la cantidad solicitada supera el inventario disponible.
# RESULTADO OBTENIDO:
La base de datos rechazó correctamente la operación y MySQL mostró el
siguiente mensaje:

Error Code: 1644. Stock insuficiente para realizar la venta

Esto demuestra que el control de inventario implementado en la base de datos
funciona correctamente.
#Estado:
Aprobado
