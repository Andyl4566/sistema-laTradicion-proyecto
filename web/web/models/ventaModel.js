const db = require('../config/database');

/**
 * Obtiene las ventas con cliente, empleado y producto.
 */
async function obtenerTodas() {
  return db.getAll(`
    SELECT
      v.id_venta AS ID_VENTA,
      v.asunto AS ASUNTO,
      v.fecha_venta AS FECHA_VENTA,
      v.monto AS MONTO,

      c.nombre AS CLIENTE,
      e.nombre AS EMPLEADO,

      p.id_producto AS ID_PRODUCTO,
      p.nombre AS PRODUCTO,

      pv.cantidad AS CANTIDAD,
      pv.precio_unitario AS PRECIO_UNITARIO

    FROM venta v

    INNER JOIN cliente c
      ON v.id_cliente = c.id_cliente

    INNER JOIN empleado e
      ON v.id_empleado = e.id_empleado

    INNER JOIN producto_venta pv
      ON v.id_venta = pv.id_venta

    INNER JOIN producto p
      ON pv.id_producto = p.id_producto

    ORDER BY v.id_venta DESC
  `);
}


/**
 * Clientes disponibles para el formulario.
 */
async function obtenerClientes() {
  return db.getAll(`
    SELECT
      id_cliente AS ID_CLIENTE,
      nombre AS NOMBRE
    FROM cliente
    ORDER BY nombre
  `);
}


/**
 * Empleados disponibles para el formulario.
 */
async function obtenerEmpleados() {
  return db.getAll(`
    SELECT
      id_empleado AS ID_EMPLEADO,
      nombre AS NOMBRE
    FROM empleado
    ORDER BY nombre
  `);
}


/**
 * Productos disponibles para vender.
 */
async function obtenerProductos() {
  return db.getAll(`
    SELECT
      id_producto AS ID_PRODUCTO,
      nombre AS NOMBRE,
      unidades AS UNIDADES,
      precio_unitario AS PRECIO_UNITARIO
    FROM producto
    ORDER BY nombre
  `);
}


/**
 * Registra una venta utilizando el procedimiento almacenado.
 */
async function registrar(datos) {
  return db.executeQuery(`
    CALL sp_registrar_venta(
      ?, ?, ?, ?, ?, ?, ?
    )
  `, [
    datos.asunto,
    datos.fecha_venta,
    Number(datos.id_empleado),
    Number(datos.id_cliente),
    Number(datos.id_producto),
    Number(datos.cantidad),
    Number(datos.precio_unitario)
  ]);
}


module.exports = {
  obtenerTodas,
  obtenerClientes,
  obtenerEmpleados,
  obtenerProductos,
  registrar
};