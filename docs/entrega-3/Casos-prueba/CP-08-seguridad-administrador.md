# CP-08 – Protección de eliminación de productos con historial

## Objetivo
Comprobar que el sistema no permita eliminar un producto que se encuentre
relacionado con ventas, producciones o materias primas, evitando la pérdida
accidental de información histórica.

## Datos utilizados

Producto utilizado:

- ID producto: 1
- Nombre: Nachos barbacoa
- Unidades actuales: 87
- Precio unitario: Q15.00

Relaciones existentes antes de realizar la prueba:

- Ventas relacionadas: 2
- Producciones relacionadas: 11
- Materias primas relacionadas: 3

## Procedimiento

Se intentó eliminar el producto mediante la siguiente instrucción:

DELETE FROM producto
WHERE id_producto = 1;

## Resultado esperado

La base de datos debe impedir la eliminación del producto debido a que existen
registros relacionados con él.

Las restricciones de llave foránea configuradas con ON DELETE RESTRICT deben
proteger la información histórica.

## Resultado obtenido

MySQL rechazó correctamente la operación y mostró:

Error Code: 1451
Cannot delete or update a parent row: a foreign key constraint fails.

Posteriormente se verificó que el producto continuara almacenado en la base
de datos.

Resultado:

- ID producto: 1
- Nombre: Nachos barbacoa
- Unidades: 87
- Precio unitario: Q15.00

También se verificaron nuevamente sus relaciones:

- Ventas relacionadas: 2
- Producciones relacionadas: 11
- Materias primas relacionadas: 3

Ninguno de estos registros fue eliminado.

## Validación

La prueba demuestra que las restricciones de integridad referencial protegen
correctamente el historial del sistema.

No es posible eliminar un producto que todavía se encuentre relacionado con
ventas, producciones o materias primas.

Esto evita que la eliminación de un producto provoque la pérdida de registros
históricos importantes.

## Estado de la prueba

APROBADO
