/**
 * Punto de Entrada Principal de la Aplicación Web
 * Empresa de Tortillas, Nachos y Harina - Entrega 2
 * 
 * RESPONSABILIDADES:
 * - Configurar el servidor Express
 * - Conectar vistas (EJS)
 * - Configurar sesiones
 * - Registrar rutas
 * - Manejo global de errores
 * 
 * INICIO:
 *   npm install
 *   npm start
 */

const express = require('express');
const session = require('express-session');
const path = require('path');
const expressLayouts = require('express-ejs-layouts');

const config = require('./config/envConfig');
const db = require('./config/database');

// ========== CREAR APLICACIÓN EXPRESS ==========
const app = express();

// ========== CONFIGURACIÓN DE VISTAS ==========
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Activar layouts EJS
app.use(expressLayouts);

// Layout principal para páginas internas
app.set('layout', 'layout');

// ========== MIDDLEWARE DE PARSEO ==========
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// ========== ARCHIVOS ESTÁTICOS ==========
app.use(express.static(path.join(__dirname, 'public')));

// ========== CONFIGURACIÓN DE SESIONES ==========
app.use(session({
  secret: config.sessionSecret,
  resave: false,
  saveUninitialized: false,
  cookie: {
    secure: config.environment === 'production',
    httpOnly: true,
    maxAge: 24 * 60 * 60 * 1000
  }
}));

// ========== MIDDLEWARE DE LOGGING ==========
app.use((req, res, next) => {
  console.log(
    `[${new Date().toISOString()}] ${req.method} ${req.path}`
  );

  next();
});

// ========== MIDDLEWARE GLOBAL DE USUARIO ==========
app.use((req, res, next) => {
  res.locals.usuario =
    req.session?.usuario || null;

  next();
});

// ========== RUTAS ==========
const {
  router: authRoutes
} = require('./routes/authRoutes');

const homeRoutes =
  require('./routes/homeRoutes');

const clienteRoutes =
  require('./routes/clienteRoutes');

const proveedorRoutes =
  require('./routes/proveedorRoutes');

// Registrar rutas
app.use('/', authRoutes);
app.use('/', homeRoutes);
app.use('/', clienteRoutes);
app.use('/', proveedorRoutes);

// ========== RUTA DE PRUEBA ==========
app.get('/health', (req, res) => {
  res.json({
    status: 'OK',
    timestamp: new Date().toISOString(),
    server: 'Empresa de Tortillas, Nachos y Harina'
  });
});

// ========== MANEJO DE RUTAS NO ENCONTRADAS ==========
app.use((req, res) => {
  res.status(404).render('error', {
    titulo: '404 - Página No Encontrada',
    mensajeError:
      `La página "${req.path}" no existe.`
  });
});

// ========== MANEJO GLOBAL DE ERRORES ==========
app.use((err, req, res, next) => {
  console.error(
    'Error no manejado:',
    err
  );

  res.status(500).render('error', {
    titulo: 'Error del Sistema',
    mensajeError:
      'Ocurrió un error inesperado. El equipo técnico ha sido notificado.'
  });
});

// ========== INICIAR SERVIDOR ==========
const PORT = config.port;

let server;

async function startServer() {
  try {

    console.log(
      '1. Antes de conectar a MySQL'
    );

    await db.initializeConnection();

    console.log(
      '2. MySQL conectado'
    );

    console.log(
      '3. Intentando abrir puerto:',
      PORT
    );

    server = app.listen(
      PORT,
      '127.0.0.1',
      () => {

        console.log(
          '4. SERVIDOR ESCUCHANDO'
        );

        console.log(
          `http://localhost:${PORT}`
        );

        console.log(
          `http://localhost:${PORT}/login`
        );

        console.log(
          `http://localhost:${PORT}/home`
        );

        console.log(
          `http://localhost:${PORT}/clientes`
        );

        console.log(
          `http://localhost:${PORT}/health`
        );

      }
    );

    server.on(
      'error',
      (error) => {
        console.error(
          '❌ ERROR DEL SERVIDOR HTTP:',
          error
        );
      }
    );

    server.on(
      'close',
      () => {
        console.log(
          '⚠ El servidor HTTP fue cerrado'
        );
      }
    );

    process.on(
      'SIGTERM',
      gracefulShutdown
    );

    process.on(
      'SIGINT',
      gracefulShutdown
    );

  } catch (error) {

    console.error(
      '❌ ERROR AL INICIAR:',
      error
    );

  }
}

/**
 * Cierra el servidor de forma segura
 */
async function gracefulShutdown() {

  console.log(
    '\n✓ Cerrando servidor...'
  );

  if (server) {

    server.close(
      async () => {

        await db.closeConnection();

        console.log(
          '✓ Servidor cerrado correctamente'
        );

        process.exit(0);

      }
    );

  } else {

    await db.closeConnection();

    process.exit(0);

  }
}

// ========== DETECTORES DE CIERRE Y ERRORES DE NODE ==========
process.on(
  'beforeExit',
  (code) => {
    console.log(
      '⚠ BEFORE EXIT. Código:',
      code
    );
  }
);

process.on(
  'exit',
  (code) => {
    console.log(
      '⚠ NODE SE ESTÁ CERRANDO. Código:',
      code
    );
  }
);

process.on(
  'uncaughtException',
  (error) => {

    console.error(
      '❌ UNCAUGHT EXCEPTION:'
    );

    console.error(error);

  }
);

process.on(
  'unhandledRejection',
  (reason) => {

    console.error(
      '❌ UNHANDLED REJECTION:'
    );

    console.error(reason);

  }
);

// ========== INICIAR LA APLICACIÓN ==========
startServer();

module.exports = app;