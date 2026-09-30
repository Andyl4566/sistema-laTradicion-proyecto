const db = require('../config/database');

/**
 * Obtiene el historial de producción junto con
 * el producto y la cantidad fabricada.
 */
async function obtenerTodas() {
  return db.getAll(`
    SELECT
      pr.id_produccion AS ID_PRODUCCION,
      pr.nombre AS NOMBRE,
      pr.descripcion AS DESCRIPCION,
      pr.fecha_produccion AS FECHA_PRODUCCION,
      p.id_producto AS ID_PRODUCTO,
      p.nombre AS PRODUCTO,
      df.cantidad_producida AS CANTIDAD_PRODUCIDA
    FROM produccion pr
    INNER JOIN detalle_fabricacion df
      ON pr.id_produccion = df.id_produccion
    INNER JOIN producto p
      ON df.id_producto = p.id_producto
    ORDER BY pr.id_produccion DESC
  `);
}

/**
 * Obtiene los productos disponibles.
 */
async function obtenerProductos() {
  return db.getAll(`
    SELECT
      id_producto AS ID_PRODUCTO,
      nombre AS NOMBRE,
      unidades AS UNIDADES
    FROM producto
    ORDER BY nombre
  `);
}

/**
 * Obtiene la receta de un producto.
 * Se utiliza para mostrar al usuario las materias
 * primas necesarias para fabricar una unidad.
 */
async function obtenerReceta(idProducto) {
  return db.getAll(`
    SELECT
      mp.nombre AS MATERIA_PRIMA,
      mp.cantidad AS STOCK_DISPONIBLE,
      mpp.cantidad AS CANTIDAD_NECESARIA
    FROM materia_prima_producto mpp
    INNER JOIN materia_prima mp
      ON mpp.id_materia_prima = mp.id_materia_prima
    WHERE mpp.id_producto = ?
    ORDER BY mp.nombre
  `, [Number(idProducto)]);
}

/**
 * Registra la producción utilizando el
 * procedimiento almacenado.
 */
async function registrar(datos) {
  return db.executeQuery(`
    CALL sp_registrar_produccion(
      ?, ?, ?, ?, ?
    )
  `, [
    datos.nombre,
    datos.descripcion || null,
    datos.fecha_produccion,
    Number(datos.id_producto),
    Number(datos.cantidad_producida)
  ]);
}

module.exports = {
  obtenerTodas,
  obtenerProductos,
  obtenerReceta,
  registrar
};