const express = require('express');
const router = express.Router();

const productoController =
  require('../controllers/productoController');

const { permitirRoles } =
  require('../middleware/authMiddleware');

// Consultar productos:
// Administrador, Ventas y Producción
router.get(
  '/productos',
  permitirRoles('administrador', 'ventas', 'produccion'),
  productoController.listarProductos
);

// Crear producto: solo administrador
router.get(
  '/productos/nuevo',
  permitirRoles('administrador'),
  productoController.mostrarCrear
);

router.post(
  '/productos/nuevo',
  permitirRoles('administrador'),
  productoController.crearProducto
);

// Editar producto: solo administrador
router.get(
  '/productos/editar/:id',
  permitirRoles('administrador'),
  productoController.mostrarEditar
);

router.post(
  '/productos/editar/:id',
  permitirRoles('administrador'),
  productoController.actualizarProducto
);

// Eliminar producto: solo administrador
router.post(
  '/productos/eliminar/:id',
  permitirRoles('administrador'),
  productoController.eliminarProducto
);

module.exports = router;