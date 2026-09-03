/** Modelo CRUD de proveedor para MySQL. */
const db = require('../config/database');

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

async function eliminar(idProveedor) {
  return db.executeQuery(
    'DELETE FROM proveedor WHERE id_proveedor = ?',
    [Number(idProveedor)]
  );
}

module.exports = { obtenerTodos, obtenerPorId, crear, actualizar, eliminar };
