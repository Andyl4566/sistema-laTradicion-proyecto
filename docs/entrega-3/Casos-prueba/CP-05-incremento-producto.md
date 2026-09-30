Caso de Prueba 05 -- Registro de compra y actualización de inventario

Identificación

Código: CP-05
Nombre: Registro de compra y actualización de inventario de materia
prima
Módulo: Compras / Inventario de materia prima
Estado: APROBADO

Objetivo

Verificar que el sistema permita registrar correctamente una compra de
materia prima y que, al insertar el detalle de la compra, el inventario
de la materia prima aumente automáticamente.

Precondiciones

La base de datos bd_tradicion se encuentra disponible.

Existe el proveedor MASECA, con id_proveedor = 1.

Existe la materia prima Harina de maíz, con
id_materia_prima = 1.

El stock inicial de Harina de maíz es 62.50.

Existe el trigger trg_compra_aumentar_materia_prima sobre
detalle_compra_materia_prima.

Datos de prueba

Campo               Valor

ID de compra        3
Fecha               2026-09-20
Proveedor           MASECA
Materia prima       Harina de maíz
Cantidad comprada   10.00
Precio unitario     Q5.00
Total de compra     Q50.00
Stock inicial       62.50
Stock esperado      72.50

Procedimiento

Consultar el stock actual de la Harina de maíz.

Registrar la compra número 3 por Q50.00 al proveedor MASECA.

Registrar en detalle_compra_materia_prima 10 unidades de Harina de
maíz a Q5.00 cada una.

Confirmar la transacción.

Consultar la compra registrada y su detalle.

Consultar nuevamente el stock de Harina de maíz.

Comparar el stock final con el valor esperado.

Resultado esperado

La compra debe registrarse correctamente y el inventario de Harina de
maíz debe aumentar de 62.50 a 72.50.

62.50 + 10.00 = 72.50

Resultado obtenido

La compra número 3 fue registrada correctamente con el proveedor
MASECA, una cantidad de 10.00 de Harina de maíz, precio unitario
de Q5.00 y total de Q50.00.

Después de registrar el detalle, el stock de Harina de maíz cambió de
62.50 a 72.50, coincidiendo con el resultado esperado.

Validación

El trigger trg_compra_aumentar_materia_prima actualizó correctamente
el inventario después de insertar el detalle de la compra.

Resultado final: APROBADO

Evidencias

Evidencia 1: stock inicial de Harina de maíz = 62.50.

Evidencia 2: compra número 3 registrada por Q50.00.

Evidencia 3: stock final de Harina de maíz = 72.50.
