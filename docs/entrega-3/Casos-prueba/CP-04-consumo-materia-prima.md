# CP-04 – Registro de producción y actualización de inventario

## Objetivo

Verificar que el procedimiento de registro de producción funcione correctamente,
aumentando el inventario del producto fabricado y descontando automáticamente
las materias primas utilizadas.

## Tablas y procedimientos involucrados

- `produccion`
- `detalle_fabricacion`
- `producto`
- `materia_prima`
- `materia_prima_producto`
- Procedimiento `sp_registrar_produccion`

## Datos iniciales

Para la prueba se utilizó el producto:

- ID producto: 1
- Producto: Nachos barbacoa
- Stock inicial: 82 unidades
- Cantidad a producir: 5 unidades

La receta registrada para el producto utiliza:

| Materia prima | Cantidad por producto | Stock inicial |
|---|---:|---:|
| Harina de maíz | 0.50 | 65.00 |
| Aceite | 0.10 | 43.00 |
| Sal | 0.05 | 21.50 |

## Procedimiento

Se ejecutó el procedimiento almacenado encargado de registrar una producción:

```sql
USE bd_tradicion;

CALL sp_registrar_produccion(
    'CP-04 Produccion de Nachos',
    'Prueba de registro de produccion e inventario',
    '2026-09-20',
    1,
    5
);
```

## Resultado esperado

La base de datos debe:

1. Crear un nuevo registro en `produccion`.
2. Registrar las 5 unidades fabricadas en `detalle_fabricacion`.
3. Aumentar en 5 unidades el inventario de Nachos barbacoa.
4. Descontar las materias primas según la receta registrada.

Los valores esperados después de producir 5 unidades eran:

| Elemento | Antes | Después esperado |
|---|---:|---:|
| Nachos barbacoa | 82 | 87 |
| Harina de maíz | 65.00 | 62.50 |
| Aceite | 43.00 | 42.50 |
| Sal | 21.50 | 21.25 |

## Resultado obtenido

El procedimiento respondió:

`Produccion registrada correctamente`

Se creó la producción con:

- ID producción: 11
- Producto: 1
- Cantidad producida: 5
- Fecha: 2026-09-20

El registro también fue almacenado correctamente en `detalle_fabricacion`.

Después de ejecutar el procedimiento se obtuvieron los siguientes inventarios:

| Elemento | Stock final |
|---|---:|
| Nachos barbacoa | 87 |
| Harina de maíz | 62.50 |
| Aceite | 42.50 |
| Sal | 21.25 |

Los resultados obtenidos coinciden con los valores esperados.

## Validación

La prueba demuestra que el procedimiento de producción realiza correctamente
las operaciones relacionadas con la fabricación:

- Registra la producción.
- Registra la cantidad fabricada.
- Incrementa el inventario del producto terminado.
- Descuenta las materias primas utilizadas.

Esto mantiene sincronizado el inventario de productos y materias primas.

## Estado

**APROBADO**

## Evidencia

Adjuntar las capturas donde se observe:

1. Ejecución correcta de `sp_registrar_produccion`.
2. Registro de la producción número 11.
3. Registro de 5 unidades en `detalle_fabricacion`.
4. Stock final de las materias primas.
5. Stock final de 87 unidades de Nachos barbacoa.
