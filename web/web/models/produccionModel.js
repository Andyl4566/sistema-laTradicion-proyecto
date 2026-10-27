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
      df.cantidad_producida AS CANTIDAD_PRODUCIDA,
      pr.estado AS ESTADO,
      pr.motivo_anulacion AS MOTIVO_ANULACION
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
    SELECT p.id_producto AS ID_PRODUCTO, p.nombre AS NOMBRE,
           p.unidades AS UNIDADES
    FROM producto p
    WHERE EXISTS (SELECT 1 FROM materia_prima_producto r
                  WHERE r.id_producto = p.id_producto)
    ORDER BY p.nombre
  `);
}

/**
 * Consulta datos relacionados con «obtenerRecetasDisponibles» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function obtenerRecetasDisponibles() {
  return db.getAll(`
    SELECT r.id_producto AS ID_PRODUCTO,
           mp.id_materia_prima AS ID_MATERIA_PRIMA,
           mp.nombre AS MATERIA_PRIMA,
           mp.unidad_medida AS UNIDAD,
           mp.cantidad AS DISPONIBLE,
           r.cantidad AS POR_UNIDAD
    FROM materia_prima_producto r
    INNER JOIN materia_prima mp ON mp.id_materia_prima = r.id_materia_prima
    ORDER BY r.id_producto, mp.nombre
  `);
}

/**
 * Registra información mediante la operación «registrarMultiple».
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function registrarMultiple(datos) {
  return db.executeQuery('CALL sp_registrar_produccion_multiple(?, ?, ?, ?)', [
    datos.nombre, datos.descripcion || null, datos.fecha_produccion,
    JSON.stringify(datos.productos)
  ]);
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

/**
 * Consulta datos relacionados con «obtenerDetalle» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function obtenerDetalle(id) {
  const produccion = await db.getOne(`
    SELECT pr.id_produccion AS ID, pr.nombre AS NOMBRE,
           pr.descripcion AS DESCRIPCION, pr.fecha_produccion AS FECHA,
           pr.estado AS ESTADO, pr.motivo_anulacion AS MOTIVO,
           pr.fecha_anulacion AS FECHA_ANULACION
    FROM produccion pr WHERE pr.id_produccion = ?
  `, [id]);
  if (!produccion) return null;
  const productos = await db.getAll(`
    SELECT p.nombre AS NOMBRE, df.cantidad_producida AS CANTIDAD
    FROM detalle_fabricacion df
    JOIN producto p ON p.id_producto = df.id_producto
    WHERE df.id_produccion = ?
  `, [id]);
  const consumos = await db.getAll(`
    SELECT mp.nombre AS NOMBRE, mp.unidad_medida AS UNIDAD,
           mpp.cantidad_consumida AS CANTIDAD
    FROM materia_prima_produccion mpp
    JOIN materia_prima mp ON mp.id_materia_prima = mpp.id_materia_prima
    WHERE mpp.id_produccion = ?
  `, [id]);
  return { produccion, productos, consumos };
}

/**
 * Ejecuta la operación «anular» sobre un registro.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function anular(id, motivo) {
  return db.executeQuery('CALL sp_anular_produccion(?, ?)', [id, motivo]);
}

module.exports = {
  obtenerTodas,
  obtenerProductos,
  obtenerRecetasDisponibles,
  registrarMultiple,
  obtenerReceta,
  registrar,
  obtenerDetalle,
  anular
};
