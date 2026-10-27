const db = require('../config/database');
const fields = 'id_gastos_operativos AS ID, descripcion AS DESCRIPCION, motivo AS MOTIVO, fecha_gasto AS FECHA, monto AS MONTO, estado AS ESTADO';
/**
 * Consulta datos relacionados con «listar» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function listar(f = {}) {
  const where = [], params = [];
  if (f.busqueda) { where.push('(descripcion LIKE ? OR motivo LIKE ?)'); const q = `%${f.busqueda}%`; params.push(q,q); }
  if (f.categoria) { where.push('descripcion = ?'); params.push(f.categoria); }
  if (f.desde) { where.push('fecha_gasto >= ?'); params.push(f.desde); }
  if (f.hasta) { where.push('fecha_gasto <= ?'); params.push(f.hasta); }
  const cond = where.length ? ' WHERE ' + where.join(' AND ') : '';
  const registros = await db.getAll(`SELECT ${fields} FROM gastos_operativos${cond} ORDER BY fecha_gasto DESC, id_gastos_operativos DESC`,params);
  const [resumen] = await db.getAll(`SELECT COUNT(*) AS cantidad, COALESCE(SUM(monto),0) AS total FROM gastos_operativos${cond}`,params);
  const categorias = await db.getAll('SELECT DISTINCT descripcion FROM gastos_operativos WHERE descripcion IS NOT NULL AND descripcion <> \'\' ORDER BY descripcion');
  return {registros, resumen, categorias};
}
/**
 * Consulta datos relacionados con «porId» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function porId(id) { return db.getOne(`SELECT ${fields} FROM gastos_operativos WHERE id_gastos_operativos=?`,[id]); }
/**
 * Registra información mediante la operación «crear».
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function crear(d) {
  if (!db.pool()) await db.initializeConnection();
  const conn = await db.pool().getConnection();
  let locked = false;
  try {
    const [[r]] = await conn.query("SELECT GET_LOCK('bd_tradicion_gastos_id', 10) AS obtenido");
    if (r.obtenido !== 1) throw new Error('No se pudo reservar el identificador del gasto.');
    locked = true;
    await conn.beginTransaction();
    const [[max]] = await conn.query('SELECT COALESCE(MAX(id_gastos_operativos),0)+1 AS siguiente FROM gastos_operativos');
    await conn.execute('INSERT INTO gastos_operativos (id_gastos_operativos,descripcion,motivo,fecha_gasto,monto,estado) VALUES (?,?,?,?,?,?)', [max.siguiente,d.descripcion,d.motivo,d.fecha,d.monto,d.estado]);
    await conn.commit(); return max.siguiente;
  } catch(e) { await conn.rollback(); throw e; }
  finally { if(locked) await conn.query("SELECT RELEASE_LOCK('bd_tradicion_gastos_id')"); conn.release(); }
}
/**
 * Actualiza información mediante la operación «actualizar».
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function actualizar(id,d) { return db.executeQuery('UPDATE gastos_operativos SET descripcion=?, motivo=?, fecha_gasto=?, monto=?, estado=? WHERE id_gastos_operativos=?',[d.descripcion,d.motivo,d.fecha,d.monto,d.estado,id]); }
/**
 * Ejecuta la operación «eliminar» sobre un registro.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function eliminar(id) { return db.executeQuery('DELETE FROM gastos_operativos WHERE id_gastos_operativos=?',[id]); }
module.exports={listar,porId,crear,actualizar,eliminar};
