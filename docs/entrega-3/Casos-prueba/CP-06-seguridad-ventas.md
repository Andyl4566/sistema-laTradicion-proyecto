# Caso de Prueba 06 – Validación de integridad referencial en compras

## Identificación

**Código:** CP-06  
**Nombre:** Validación de proveedor existente al registrar una compra  
**Módulo:** Compras / Proveedores  
**Estado:** APROBADO

## Objetivo

Verificar que la base de datos impida registrar una compra asociada a un proveedor que no existe, garantizando la integridad referencial mediante la llave foránea entre las tablas `compras` y `proveedor`.

## Precondiciones

- La base de datos `bd_tradicion` se encuentra disponible.
- La tabla `proveedor` contiene los proveedores registrados.
- La tabla `compras` posee una llave foránea hacia `proveedor`.
- El proveedor con `id_proveedor = 9999` no existe.

## Datos de prueba

| Campo | Valor |
|---|---|
| ID de compra | 9999 |
| Fecha | 2026-09-20 |
| Monto | Q100.00 |
| ID proveedor | 9999 |
| Existencia del proveedor | No existe |

## Procedimiento

1. Consultar la tabla `proveedor` buscando el `id_proveedor = 9999`.
2. Confirmar que el proveedor no existe.
3. Intentar registrar una compra utilizando el proveedor 9999.
4. Verificar la respuesta generada por MySQL.
5. Consultar la tabla `compras` buscando el `id_compras = 9999`.
6. Confirmar que la compra inválida no fue almacenada.

## Resultado esperado

MySQL debe rechazar el registro de la compra debido a que el proveedor 9999 no existe y se estaría violando la restricción de llave foránea.

La compra 9999 no debe quedar almacenada en la base de datos.

## Resultado obtenido

El proveedor con ID 9999 no fue encontrado en la tabla `proveedor`.

Al intentar registrar la compra utilizando dicho proveedor, MySQL rechazó la operación y generó el:

**Error Code: 1452 – Cannot add or update a child row: a foreign key constraint fails.**

Posteriormente se consultó la compra con ID 9999 y no se encontró ningún registro, confirmando que la operación inválida no fue almacenada.

## Validación

La llave foránea entre `compras` y `proveedor` funcionó correctamente, evitando que se almacenen compras asociadas a proveedores inexistentes.

**Resultado final: APROBADO**

## Evidencias

- Evidencia 1: consulta del proveedor 9999 sin resultados.
- Evidencia 2: Error 1452 al intentar registrar la compra con un proveedor inexistente.
- Evidencia 3: consulta de la compra 9999 sin resultados después del intento fallido.
