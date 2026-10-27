const db = require('../config/database');

/** Lista una fila por venta, con resumen de productos y unidades. */
async function obtenerTodas(filtros = {}) {
  const condiciones = [];
  const params = [];
  if (filtros.busqueda) {
    condiciones.push("(v.asunto LIKE ? OR c.nombre LIKE ? OR e.nombre LIKE ?)");
    const patron = `%${filtros.busqueda}%`;
    params.push(patron, patron, patron);
  }
  if (filtros.estado) { condiciones.push("v.estado = ?"); params.push(filtros.estado); }
  if (filtros.desde) { condiciones.push("v.fecha_venta >= ?"); params.push(filtros.desde); }
  if (filtros.hasta) { condiciones.push("v.fecha_venta <= ?"); params.push(filtros.hasta); }
  const where = condiciones.length ? `WHERE ${condiciones.join(" AND ")}` : "";
  return db.getAll(`
    SELECT v.id_venta AS ID_VENTA, v.asunto AS ASUNTO,
           v.fecha_venta AS FECHA_VENTA, v.monto AS MONTO, v.estado AS ESTADO, v.motivo_anulacion AS MOTIVO_ANULACION, v.fecha_anulacion AS FECHA_ANULACION,
           c.nombre AS CLIENTE, e.nombre AS EMPLEADO,
           GROUP_CONCAT(CONCAT(p.nombre, ' (', pv.cantidad, ')')
             ORDER BY p.nombre SEPARATOR ', ') AS PRODUCTOS,
           SUM(pv.cantidad) AS UNIDADES,
           COUNT(*) AS TIPOS_PRODUCTOS
    FROM venta v
    JOIN cliente c ON c.id_cliente = v.id_cliente
    JOIN empleado e ON e.id_empleado = v.id_empleado
    JOIN producto_venta pv ON pv.id_venta = v.id_venta
    JOIN producto p ON p.id_producto = pv.id_producto
    ${where}
    GROUP BY v.id_venta, v.asunto, v.fecha_venta, v.monto, v.estado, v.motivo_anulacion, v.fecha_anulacion, c.nombre, e.nombre
    ORDER BY v.id_venta DESC
  `, params);
}

/** Datos para los selectores de venta. */
async function obtenerClientes() {
  return db.getAll('SELECT id_cliente AS ID_CLIENTE, nombre AS NOMBRE FROM cliente ORDER BY nombre');
}
/**
 * Consulta datos relacionados con «obtenerEmpleados» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function obtenerEmpleados() {
  return db.getAll('SELECT id_empleado AS ID_EMPLEADO, nombre AS NOMBRE FROM empleado ORDER BY nombre');
}
/**
 * Consulta datos relacionados con «obtenerProductos» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function obtenerProductos() {
  return db.getAll('SELECT id_producto AS ID_PRODUCTO, nombre AS NOMBRE, unidades AS UNIDADES, precio_unitario AS PRECIO_UNITARIO FROM producto ORDER BY nombre');
}

/** Registra una venta atómica con múltiples detalles. */
async function registrar(datos) {
  return db.executeQuery('CALL sp_registrar_venta_multiple(?, ?, ?, ?, ?)', [
    datos.asunto, datos.fecha_venta, datos.id_empleado, datos.id_cliente,
    JSON.stringify(datos.productos)
  ]);
}
/** Anula una venta de forma transaccional en MySQL. */
async function anular(idVenta, motivo) {
  return db.executeQuery('CALL sp_anular_venta(?, ?)', [idVenta, motivo]);
}
module.exports = { obtenerTodas, obtenerClientes, obtenerEmpleados, obtenerProductos, registrar, anular };
