/**
 * Modelo CRUD de productos para MySQL.
 */
const db = require('../config/database');

/**
 * Obtiene todos los productos.
 */
async function obtenerTodos() {
  return db.getAll(`
    SELECT
      id_producto AS ID_PRODUCTO,
      nombre AS NOMBRE,
      descripcion AS DESCRIPCION,
      unidades AS UNIDADES,
      precio_unitario AS PRECIO_UNITARIO
    FROM producto
    ORDER BY id_producto
  `);
}

/**
 * Obtiene un producto por su ID.
 */
async function obtenerPorId(idProducto) {
  return db.getOne(`
    SELECT
      id_producto AS ID_PRODUCTO,
      nombre AS NOMBRE,
      descripcion AS DESCRIPCION,
      unidades AS UNIDADES,
      precio_unitario AS PRECIO_UNITARIO
    FROM producto
    WHERE id_producto = ?
  `, [Number(idProducto)]);
}

/**
 * Crea un nuevo producto.
 */
async function crear(datos) {

  // Obtener el siguiente ID disponible
  const resultado = await db.getOne(`
    SELECT COALESCE(MAX(id_producto), 0) + 1 AS siguiente_id
    FROM producto
  `);

  const nuevoId = resultado.siguiente_id;

  // Registrar el nuevo producto
  return db.executeQuery(`
    INSERT INTO producto (
      id_producto,
      nombre,
      descripcion,
      unidades,
      precio_unitario
    )
    VALUES (?, ?, ?, ?, ?)
  `, [
    nuevoId,
    datos.nombre,
    datos.descripcion || null,
    Number(datos.unidades),
    Number(datos.precio_unitario)
  ]);
}

/**
 * Actualiza un producto.
 */
async function actualizar(idProducto, datos) {
  return db.executeQuery(`
    UPDATE producto
    SET
      nombre = ?,
      descripcion = ?,
      unidades = ?,
      precio_unitario = ?
    WHERE id_producto = ?
  `, [
    datos.nombre,
    datos.descripcion || null,
    Number(datos.unidades),
    Number(datos.precio_unitario),
    Number(idProducto)
  ]);
}

/**
 * Elimina un producto.
 */
async function eliminar(idProducto) {
  return db.executeQuery(
    'DELETE FROM producto WHERE id_producto = ?',
    [Number(idProducto)]
  );
}

module.exports = {
  obtenerTodos,
  obtenerPorId,
  crear,
  actualizar,
  eliminar
};