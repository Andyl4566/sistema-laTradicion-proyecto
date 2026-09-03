/** Modelo CRUD de cliente para MySQL. */
const db = require('../config/database');

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

async function eliminar(idCliente) {
  return db.executeQuery(
    'DELETE FROM cliente WHERE id_cliente = ?',
    [Number(idCliente)]
  );
}

module.exports = { obtenerTodos, obtenerPorId, crear, actualizar, eliminar };
