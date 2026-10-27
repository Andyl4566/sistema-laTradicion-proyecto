const db = require('../config/database');

const campos = `id_empleado AS ID_EMPLEADO, nombre AS NOMBRE, dpi AS DPI,
 telefono AS TELEFONO, salario AS SALARIO, fecha_contratacion AS FECHA_CONTRATACION,
 estado AS ESTADO`;

/**
 * Consulta datos relacionados con «obtenerTodos» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function obtenerTodos() {
  return db.getAll(`SELECT ${campos} FROM empleado ORDER BY id_empleado DESC`);
}
/**
 * Consulta datos relacionados con «obtenerPorId» en la base de datos.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function obtenerPorId(id) {
  return db.getOne(`SELECT ${campos} FROM empleado WHERE id_empleado = ?`, [id]);
}
/**
 * Registra información mediante la operación «crear».
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function crear(d) {
  // El esquema actual no tiene AUTO_INCREMENT; inserción protegida mediante bloqueo transaccional.
  if (!db.pool()) await db.initializeConnection();
  const conn = await db.pool().getConnection();
  try {
    await conn.beginTransaction();
    // Bloquea una fila existente para serializar creaciones desde este módulo.
    const [filas] = await conn.query('SELECT id_empleado FROM empleado ORDER BY id_empleado DESC LIMIT 1 FOR UPDATE');
    const id = filas.length ? filas[0].id_empleado + 1 : 1;
    await conn.execute(`INSERT INTO empleado (id_empleado,nombre,dpi,telefono,salario,fecha_contratacion,estado)
      VALUES (?,?,?,?,?,?,?)`, [id,d.nombre,d.dpi,d.telefono,d.salario,d.fecha_contratacion,d.estado]);
    await conn.commit();
    return id;
  } catch (e) { await conn.rollback(); throw e; }
  finally { conn.release(); }
}
/**
 * Actualiza información mediante la operación «actualizar».
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function actualizar(id,d) {
  return db.executeQuery(`UPDATE empleado SET nombre=?, dpi=?, telefono=?, salario=?, fecha_contratacion=?, estado=? WHERE id_empleado=?`,
    [d.nombre,d.dpi,d.telefono,d.salario,d.fecha_contratacion,d.estado,id]);
}
/**
 * Ejecuta la operación «desactivar» sobre un registro.
 * @returns {Promise<*>} Resultado de la consulta u operación de base de datos.
 */
async function desactivar(id) {
  return db.executeQuery("UPDATE empleado SET estado='Inactivo' WHERE id_empleado=?", [id]);
}
module.exports = { obtenerTodos, obtenerPorId, crear, actualizar, desactivar };
