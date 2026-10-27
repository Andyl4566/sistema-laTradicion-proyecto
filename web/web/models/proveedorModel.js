/** Modelo CRUD de proveedor para MySQL. */
const db = require('../config/database');

/**
 * Consulta datos relacionados con «obtenerTodos» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function obtenerTodos() {
  return db.getAll(`
    SELECT
      id_proveedor AS ID_PROVEEDOR,
      nombre AS NOMBRE,
      telefono AS TELEFONO,
      correo AS CORREO
    FROM proveedor
    ORDER BY id_proveedor
  `);
}

/**
 * Consulta datos relacionados con «obtenerPorId» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function obtenerPorId(idProveedor) {
  return db.getOne(`
    SELECT
      id_proveedor AS ID_PROVEEDOR,
      nombre AS NOMBRE,
      telefono AS TELEFONO,
      correo AS CORREO
    FROM proveedor
    WHERE id_proveedor = ?
  `, [Number(idProveedor)]);
}

/**
 * Registra información mediante la operación «crear».
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function crear(datos) {
  return db.executeQuery(`
    INSERT INTO proveedor (nombre, telefono, correo)
    VALUES (?, ?, ?)
  `, [
    datos.nombre,
    datos.telefono || null,
    datos.correo || null
  ]);
}

/**
 * Actualiza información mediante la operación «actualizar».
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function actualizar(idProveedor, datos) {
  return db.executeQuery(`
    UPDATE proveedor
    SET nombre = ?, telefono = ?, correo = ?
    WHERE id_proveedor = ?
  `, [
    datos.nombre,
    datos.telefono || null,
    datos.correo || null,
    Number(idProveedor)
  ]);
}

/**
 * Ejecuta la operación «eliminar» sobre un registro.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function eliminar(idProveedor) {
  return db.executeQuery(
    'DELETE FROM proveedor WHERE id_proveedor = ?',
    [Number(idProveedor)]
  );
}

module.exports = { obtenerTodos, obtenerPorId, crear, actualizar, eliminar };
