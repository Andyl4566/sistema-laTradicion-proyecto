### `CP-03-integridad-referencial.md`

```markdown
# CP-03 – Validación de integridad referencial

## Objetivo

Verificar que la base de datos impida registrar una venta asociada a un
cliente inexistente.

## Tablas involucradas

- `venta`
- `cliente`
- `empleado`

## Datos utilizados

Para la prueba se utilizaron los siguientes valores:

- ID venta temporal: 9999
- ID empleado: 1
- ID cliente inexistente: 99999
- Monto: Q100.00
- Fecha: 2026-09-20

El cliente 99999 fue utilizado intencionalmente debido a que no existe en
la tabla `cliente`.

## Procedimiento

Se intentó insertar directamente una venta utilizando un cliente que no
existe en la base de datos.

```sql
USE bd_tradicion;

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
    'CP-03 Prueba integridad referencial',
    '2026-09-20',
    100.00,
    1,
    99999
);
# RESULTADO ESPERADO:
MySQL debe rechazar la operación debido a que id_cliente = 99999 no
corresponde a ningún registro existente en la tabla cliente.

Esto debe ser detectado mediante la clave foránea que relaciona las tablas
venta y cliente.
# RESULTADO OBTENIDO:
MySQL rechazó correctamente la inserción y mostró:

Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails

El resultado demuestra que la restricción de clave foránea está funcionando
correctamente y evita registrar ventas asociadas a clientes inexistentes.
# ESTADO:
Aprovado
