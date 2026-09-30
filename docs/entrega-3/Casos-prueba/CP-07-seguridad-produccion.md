# Caso de Prueba 07 – Producción con materia prima insuficiente

## Identificación

**Código:** CP-07  
**Nombre:** Validación de materia prima insuficiente en producción  
**Módulo:** Producción / Inventario  
**Estado:** APROBADO

## Objetivo

Verificar que el sistema impida registrar una producción cuando no existe
suficiente materia prima y que, al producirse el error, no se modifiquen
los inventarios ni se almacene una producción incompleta.

## Precondiciones

- La base de datos `bd_tradicion` se encuentra disponible.
- Existe el producto Nachos barbacoa con `id_producto = 1`.
- El producto tiene materias primas asociadas mediante
  `materia_prima_producto`.
- Existe el procedimiento `sp_registrar_produccion`.
- La Harina de maíz disponible es insuficiente para producir 200 unidades.

## Datos de prueba

| Dato | Valor |
|---|---:|
| Producto | Nachos barbacoa |
| ID producto | 1 |
| Cantidad solicitada | 200 |
| Harina disponible | 72.50 |
| Aceite disponible | 42.50 |
| Sal disponible | 21.25 |
| Producto terminado antes de la prueba | 87 unidades |
| Última producción registrada | 11 |

Para producir 200 unidades se requieren 100.00 unidades de Harina de maíz:

`200 × 0.50 = 100.00`

Como solamente existen 72.50, la producción no debe permitirse.

## Procedimiento

1. Consultar las existencias actuales de Harina de maíz, Aceite y Sal.
2. Consultar las unidades disponibles de Nachos barbacoa.
3. Consultar la última producción registrada.
4. Intentar registrar una producción de 200 unidades mediante
   `sp_registrar_produccion`.
5. Verificar el mensaje generado por el procedimiento.
6. Comprobar que la producción fallida no fue registrada.
7. Consultar nuevamente las cantidades de las materias primas.
8. Consultar nuevamente las unidades del producto terminado.

## Resultado esperado

El procedimiento debe detectar que no existe suficiente Harina de maíz
para fabricar 200 unidades y cancelar la operación.

No debe registrarse una nueva producción, no debe descontarse materia
prima y no deben aumentar las unidades del producto terminado.

## Resultado obtenido

El procedimiento rechazó correctamente la operación y MySQL mostró:

**Error Code: 1644. Materia prima insuficiente para realizar la produccion**

Después del error:

- No se encontró ninguna producción denominada
  `CP-07 Produccion insuficiente`.
- Harina de maíz permaneció en 72.50.
- Aceite permaneció en 42.50.
- Sal permaneció en 21.25.
- Nachos barbacoa permaneció en 87 unidades.

## Validación

El procedimiento `sp_registrar_produccion` detectó correctamente la
falta de materia prima y canceló la transacción mediante ROLLBACK.

Esto evitó que se almacenara una producción incompleta o que se
modificaran incorrectamente los inventarios.

**Resultado final: APROBADO**

## Evidencias

- Evidencia 1: cantidades de materia prima antes de ejecutar la prueba.
- Evidencia 2: última producción registrada antes de la prueba.
- Evidencia 3: inventario inicial de Nachos barbacoa.
- Evidencia 4: Error 1644 por materia prima insuficiente.
- Evidencia 5: inexistencia de la producción CP-07.
- Evidencia 6: materias primas sin cambios después del error.
- Evidencia 7: inventario de Nachos barbacoa sin cambios después del error.
