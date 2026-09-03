/** Modelo de usuarios para MySQL. */
const db = require('../config/database');

async function obtenerPorNombreUsuario(nombreUsuario) {
  return db.getOne(`
    SELECT
      id_usuario AS ID_USUARIO,
      nombre_usuario AS NOMBRE_USUARIO,
      email AS EMAIL,
      password_hash AS PASSWORD_HASH,
      nombre_completo AS NOMBRE_COMPLETO,
      activo AS ACTIVO,
      fecha_creacion AS FECHA_CREACION
    FROM usuarios
    WHERE nombre_usuario = ? AND activo = 1
  `, [nombreUsuario]);
}

async function obtenerPorEmail(email) {
  return db.getOne(`
    SELECT
      id_usuario AS ID_USUARIO,
      nombre_usuario AS NOMBRE_USUARIO,
      email AS EMAIL,
      password_hash AS PASSWORD_HASH,
      nombre_completo AS NOMBRE_COMPLETO,
      activo AS ACTIVO
    FROM usuarios
    WHERE email = ? AND activo = 1
  `, [email]);
}

async function obtenerPorId(idUsuario) {
  return db.getOne(`
    SELECT
      id_usuario AS ID_USUARIO,
      nombre_usuario AS NOMBRE_USUARIO,
      email AS EMAIL,
      nombre_completo AS NOMBRE_COMPLETO,
      activo AS ACTIVO,
      fecha_creacion AS FECHA_CREACION
    FROM usuarios
    WHERE id_usuario = ? AND activo = 1
  `, [Number(idUsuario)]);
}

async function crear(datosUsuario) {
  const { nombre_usuario, email, password_hash, nombre_completo } = datosUsuario;

  // La tabla usuarios del DDL actual no tiene AUTO_INCREMENT, por eso
  // se calcula el siguiente ID en una sola sentencia INSERT...SELECT.
  const result = await db.executeQuery(`
    INSERT INTO usuarios
      (id_usuario, nombre_usuario, email, password_hash, nombre_completo, activo, fecha_creacion)
    SELECT
      COALESCE(MAX(id_usuario), 0) + 1, ?, ?, ?, ?, 1, CURRENT_TIMESTAMP
    FROM usuarios
  `, [nombre_usuario, email, password_hash, nombre_completo]);

  return { success: true, insertId: result.insertId || null };
}

async function obtenerTodos() {
  return db.getAll(`
    SELECT
      id_usuario AS ID_USUARIO,
      nombre_usuario AS NOMBRE_USUARIO,
      email AS EMAIL,
      nombre_completo AS NOMBRE_COMPLETO,
      activo AS ACTIVO,
      fecha_creacion AS FECHA_CREACION
    FROM usuarios
    WHERE activo = 1
    ORDER BY fecha_creacion DESC
  `);
}

module.exports = { obtenerPorNombreUsuario, obtenerPorEmail, obtenerPorId, crear, obtenerTodos };
