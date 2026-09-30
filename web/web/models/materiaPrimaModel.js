const db = require('../config/database');

/**
 * Obtiene todas las materias primas.
 */
async function obtenerTodas() {
  return db.getAll(`
    SELECT
      id_materia_prima AS ID_MATERIA_PRIMA,
      nombre AS NOMBRE,
      descripcion AS DESCRIPCION,
      cantidad AS CANTIDAD,
      costo AS COSTO
    FROM materia_prima
    ORDER BY id_materia_prima
  `);
}

/**
 * Obtiene una materia prima por ID.
 */
async function obtenerPorId(idMateriaPrima) {
  return db.getOne(`
    SELECT
      id_materia_prima AS ID_MATERIA_PRIMA,
      nombre AS NOMBRE,
      descripcion AS DESCRIPCION,
      cantidad AS CANTIDAD,
      costo AS COSTO
    FROM materia_prima
    WHERE id_materia_prima = ?
  `, [Number(idMateriaPrima)]);
}

/**
 * Registra una nueva materia prima.
 */
async function crear(datos) {

  // La tabla no utiliza AUTO_INCREMENT,
  // por lo que obtenemos el siguiente ID disponible.
  const resultado = await db.getOne(`
    SELECT COALESCE(MAX(id_materia_prima), 0) + 1 AS siguiente_id
    FROM materia_prima
  `);

  const nuevoId = resultado.siguiente_id;

  return db.executeQuery(`
    INSERT INTO materia_prima (
      id_materia_prima,
      nombre,
      descripcion,
      cantidad,
      costo
    )
    VALUES (?, ?, ?, ?, ?)
  `, [
    nuevoId,
    datos.nombre,
    datos.descripcion || null,
    Number(datos.cantidad),
    datos.costo === '' || datos.costo == null
      ? null
      : Number(datos.costo)
  ]);
}

/**
 * Actualiza una materia prima.
 */
async function actualizar(idMateriaPrima, datos) {
  return db.executeQuery(`
    UPDATE materia_prima
    SET
      nombre = ?,
      descripcion = ?,
      cantidad = ?,
      costo = ?
    WHERE id_materia_prima = ?
  `, [
    datos.nombre,
    datos.descripcion || null,
    Number(datos.cantidad),
    datos.costo === '' || datos.costo == null
      ? null
      : Number(datos.costo),
    Number(idMateriaPrima)
  ]);
}

/**
 * Elimina una materia prima.
 */
async function eliminar(idMateriaPrima) {
  return db.executeQuery(`
    DELETE FROM materia_prima
    WHERE id_materia_prima = ?
  `, [Number(idMateriaPrima)]);
}

module.exports = {
  obtenerTodas,
  obtenerPorId,
  crear,
  actualizar,
  eliminar
};