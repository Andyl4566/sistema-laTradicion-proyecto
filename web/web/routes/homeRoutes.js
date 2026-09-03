/**
 * Rutas de Home/Dashboard (homeRoutes)
 * 
 * Define las rutas del dashboard y página de inicio.
 * Todas las rutas requieren autenticación.
 */

const express = require('express');
const router = express.Router();
const homeController = require('../controllers/homeController');
const { verificarAutenticacion } = require('./authRoutes');

/**
 * Ruta: GET /home
 * Muestra el dashboard principal
 * Requiere autenticación
 */
router.get('/home', verificarAutenticacion, homeController.mostrarHome);

/**
 * Ruta: GET / (raíz)
 * Redirige a home (o login si no está autenticado)
 */
router.get('/', (req, res) => {
  if (req.session && req.session.usuario) {
    res.redirect('/home');
  } else {
    res.redirect('/login');
  }
});

module.exports = router;
