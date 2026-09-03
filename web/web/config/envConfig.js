/**
 * Configuración centralizada por variables de entorno.
 * Base de datos actual: MySQL / esquema bd_tradicion.
 */
require('dotenv').config();

const config = {
  port: Number(process.env.PORT || 3000),
  database: {
    host: process.env.DB_HOST || 'localhost',
    port: Number(process.env.DB_PORT || 3306),
    database: process.env.DB_NAME || 'bd_tradicion',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || ''
  },
  sessionSecret: process.env.SESSION_SECRET || 'tu_clave_secreta_cambiar_produccion',
  environment: process.env.NODE_ENV || 'development',
  validate() {
    if (!this.database.host || !this.database.user || !this.database.database) {
      console.error('ERROR: Variables de entorno incompletas. Verifica el archivo .env');
      process.exit(1);
    }
  }
};

config.validate();
module.exports = config;
