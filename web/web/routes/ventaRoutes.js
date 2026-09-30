const express = require('express');
const router = express.Router();

const ventaController =
  require('../controllers/ventaController');

const { permitirRoles } =
  require('../middleware/authMiddleware');


// Listado
router.get(
  '/ventas',
  permitirRoles('administrador', 'ventas'),
  ventaController.listarVentas
);


// Formulario nueva venta
router.get(
  '/ventas/nueva',
  permitirRoles('administrador', 'ventas'),
  ventaController.mostrarCrear
);


// Registrar venta
router.post(
  '/ventas/nueva',
  permitirRoles('administrador', 'ventas'),
  ventaController.crearVenta
);


module.exports = router;