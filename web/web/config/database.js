/**
 * Módulo de conexión a MySQL.
 * Usa mysql2/promise y un pool de conexiones.
 */
const mysql = require('mysql2/promise');
const config = require('./envConfig');

let pool = null;

async function initializeConnection() {
  if (pool) return pool;

  try {
    pool = mysql.createPool({
      host: config.database.host,
      port: config.database.port,
      user: config.database.user,
      password: config.database.password,
      database: config.database.database,
      waitForConnections: true,
      connectionLimit: 10,
      queueLimit: 0,
      charset: 'utf8mb4'
    });

    // Verificar que la conexión realmente funciona.
    const connection = await pool.getConnection();
    await connection.ping();
    connection.release();

    console.log(`✓ Pool de conexiones MySQL creado. Conectado a: ${config.database.host}:${config.database.port}/${config.database.database}`);
    return pool;
  } catch (error) {
    pool = null;
    console.error('✗ Error inicializando conexión MySQL:', error.message);
    throw error;
  }
}

async function executeQuery(query, params = []) {
  try {
    if (!pool) await initializeConnection();
    const [rows] = await pool.execute(query, params);
    return rows;
  } catch (error) {
    // Conserva el código y la causa del error para que el controlador
    // pueda manejar casos específicos sin mostrar detalles SQL al usuario.
    console.error('Error en consulta MySQL:', error.code || 'SIN_CODIGO', error.message);
    throw error;
  }
}

async function getOne(query, params = []) {
  const rows = await executeQuery(query, params);
  return Array.isArray(rows) && rows.length > 0 ? rows[0] : null;
}

async function getAll(query, params = []) {
  const rows = await executeQuery(query, params);
  return Array.isArray(rows) ? rows : [];
}

async function closeConnection() {
  try {
    if (pool) {
      console.log('✓ Cerrando pool de conexiones MySQL...');
      await pool.end();
      pool = null;
      console.log('✓ Conexión MySQL cerrada correctamente');
    }
  } catch (error) {
    console.error('Error cerrando conexión MySQL:', error.message);
  }
}

function getPool() {
  return pool;
}

module.exports = {
  initializeConnection,
  executeQuery,
  getOne,
  getAll,
  closeConnection,
  pool: getPool
};
