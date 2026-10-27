/** Modelo CRUD de cliente para MySQL. */
const db = require('../config/database');

/**
 * Consulta datos relacionados con «obtenerTodos» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function obtenerTodos() {
  return db.getAll(`
    SELECT
      id_cliente AS ID_CLIENTE,
      nombre AS NOMBRE,
      telefono AS TELEFONO,
      correo AS CORREO,
      direccion AS DIRECCION
    FROM cliente
    ORDER BY id_cliente
  `);
}

/**
 * Consulta datos relacionados con «obtenerPorId» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function obtenerPorId(idCliente) {
  return db.getOne(`
    SELECT
      id_cliente AS ID_CLIENTE,
      nombre AS NOMBRE,
      telefono AS TELEFONO,
      correo AS CORREO,
      direccion AS DIRECCION
    FROM cliente
    WHERE id_cliente = ?
  `, [Number(idCliente)]);
}

/**
 * Registra información mediante la operación «crear».
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function crear(datos) {
  return db.executeQuery(`
    INSERT INTO cliente (nombre, telefono, correo, direccion)
    VALUES (?, ?, ?, ?)
  `, [
    datos.nombre,
    datos.telefono || null,
    datos.correo || null,
    datos.direccion || null
  ]);
}

/**
 * Actualiza información mediante la operación «actualizar».
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function actualizar(idCliente, datos) {
  return db.executeQuery(`
    UPDATE cliente
    SET nombre = ?, telefono = ?, correo = ?, direccion = ?
    WHERE id_cliente = ?
  `, [
    datos.nombre,
    datos.telefono || null,
    datos.correo || null,
    datos.direccion || null,
    Number(idCliente)
  ]);
}

/**
 * Ejecuta la operación «eliminar» sobre un registro.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function eliminar(idCliente) {
  return db.executeQuery(
    'DELETE FROM cliente WHERE id_cliente = ?',
    [Number(idCliente)]
  );
}

module.exports = { obtenerTodos, obtenerPorId, crear, actualizar, eliminar };
