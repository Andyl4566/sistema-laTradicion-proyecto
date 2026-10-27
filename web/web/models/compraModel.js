const db = require('../config/database');
/**
 * Consulta datos relacionados con «listar» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function listar() { return db.getAll(`SELECT c.id_compras AS ID, c.fecha_compra AS FECHA, c.monto AS MONTO, c.estado AS ESTADO, c.motivo_anulacion AS MOTIVO_ANULACION, c.fecha_anulacion AS FECHA_ANULACION, p.nombre AS PROVEEDOR, COUNT(d.id_materia_prima) AS TIPOS, COALESCE(SUM(d.cantidad),0) AS UNIDADES FROM compras c JOIN proveedor p ON p.id_proveedor=c.id_proveedor LEFT JOIN detalle_compra_materia_prima d ON d.id_compras=c.id_compras GROUP BY c.id_compras,c.fecha_compra,c.monto,c.estado,c.motivo_anulacion,c.fecha_anulacion,p.nombre ORDER BY c.id_compras DESC`); }
/**
 * Consulta datos relacionados con «proveedores» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function proveedores() {return db.getAll('SELECT id_proveedor AS ID, nombre AS NOMBRE, telefono AS TELEFONO FROM proveedor ORDER BY nombre');}
/**
 * Consulta datos relacionados con «materias» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function materias() {return db.getAll('SELECT id_materia_prima AS ID, nombre AS NOMBRE, unidad_medida AS UNIDAD, costo AS COSTO FROM materia_prima ORDER BY nombre');}
/**
 * Consulta datos relacionados con «detalle» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function detalle(id) {return db.getAll(`SELECT d.id_compras AS ID, m.nombre AS NOMBRE, m.unidad_medida AS UNIDAD, d.cantidad AS CANTIDAD, d.precio_unitario AS PRECIO, ROUND(d.cantidad*d.precio_unitario,2) AS SUBTOTAL FROM detalle_compra_materia_prima d JOIN materia_prima m ON m.id_materia_prima=d.id_materia_prima WHERE d.id_compras=? ORDER BY m.nombre`,[id]);}
/**
 * Registra información mediante la operación «registrar».
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function registrar(fecha,proveedor,items) {return db.executeQuery('CALL sp_registrar_compra_multiple(?,?,?)',[fecha,proveedor,JSON.stringify(items)]);}
/**
 * Ejecuta la operación «anular» sobre un registro.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function anular(id,motivo) {return db.executeQuery('CALL sp_anular_compra(?,?)',[id,motivo]);}
module.exports={listar,proveedores,materias,detalle,registrar,anular};
