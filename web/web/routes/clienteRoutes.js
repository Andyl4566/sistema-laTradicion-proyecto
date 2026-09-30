const express = require('express');
const router = express.Router();

const clienteController =
  require('../controllers/clienteController');

const { permitirRoles } =
  require('../middleware/authMiddleware');

router.get(
  '/clientes',
  permitirRoles('administrador', 'ventas'),
  clienteController.listarClientes
);

router.get(
  '/clientes/nuevo',
  permitirRoles('administrador', 'ventas'),
  clienteController.mostrarCrear
);

router.post(
  '/clientes/nuevo',
  permitirRoles('administrador', 'ventas'),
  clienteController.crearCliente
);

router.get(
  '/clientes/editar/:id',
  permitirRoles('administrador', 'ventas'),
  clienteController.mostrarEditar
);

router.post(
  '/clientes/editar/:id',
  permitirRoles('administrador', 'ventas'),
  clienteController.actualizarCliente
);

// Eliminar: solo administrador
router.post(
  '/clientes/eliminar/:id',
  permitirRoles('administrador'),
  clienteController.eliminarCliente
);

module.exports = router;