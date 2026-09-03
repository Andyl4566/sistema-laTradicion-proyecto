/**
 * Rutas de Autenticación (authRoutes)
 * 
 * Define las rutas para login, logout y manejo de autenticación.
 * Incluye middleware de validación para rutas protegidas.
 */

const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

// Middleware para verificar si el usuario está autenticado
function verificarAutenticacion(req, res, next) {
  if (!req.session || !req.session.usuario) {
    return res.redirect('/login');
  }
  next();
}

/**
 * Ruta: GET /login
 * Muestra el formulario de login
 */
router.get('/login', authController.mostrarLogin);

/**
 * Ruta: POST /login
 * Procesa el formulario de login
 * Acepta: { nombreUsuario, password }
 */
router.post('/login', authController.procesarLogin);

/**
 * Ruta: GET /logout
 * Cierra la sesión del usuario
 * Requiere autenticación
 */
router.get('/logout', verificarAutenticacion, authController.logout);

// Exportar router y middleware
module.exports = {
  router,
  verificarAutenticacion
};
