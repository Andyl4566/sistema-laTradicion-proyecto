const express = require('express');
const router = express.Router();

const proveedorController =
  require('../controllers/proveedorController');

const { permitirRoles } =
  require('../middleware/authMiddleware');

router.get(
  '/proveedores',
  permitirRoles('administrador'),
  proveedorController.listarProveedores
);

router.get(
  '/proveedores/nuevo',
  permitirRoles('administrador'),
  proveedorController.mostrarCrear
);

router.post(
  '/proveedores/nuevo',
  permitirRoles('administrador'),
  proveedorController.crearProveedor
);

router.get(
  '/proveedores/editar/:id',
  permitirRoles('administrador'),
  proveedorController.mostrarEditar
);

router.post(
  '/proveedores/editar/:id',
  permitirRoles('administrador'),
  proveedorController.actualizarProveedor
);

router.post(
  '/proveedores/eliminar/:id',
  permitirRoles('administrador'),
  proveedorController.eliminarProveedor
);

module.exports = router;