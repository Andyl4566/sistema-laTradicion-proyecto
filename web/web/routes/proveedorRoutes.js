const express = require('express');

const router = express.Router();

const proveedorController =
  require('../controllers/proveedorController');


/**
 * Middleware de autenticación
 */
function requiereAutenticacion(
  req,
  res,
  next
) {

  if (
    !req.session ||
    !req.session.usuario
  ) {

    return res.redirect('/login');

  }

  next();

}


// Listar proveedores
router.get(
  '/proveedores',
  requiereAutenticacion,
  proveedorController.listarProveedores
);


// Mostrar formulario nuevo
router.get(
  '/proveedores/nuevo',
  requiereAutenticacion,
  proveedorController.mostrarCrear
);


// Crear proveedor
router.post(
  '/proveedores/nuevo',
  requiereAutenticacion,
  proveedorController.crearProveedor
);


// Mostrar formulario editar
router.get(
  '/proveedores/editar/:id',
  requiereAutenticacion,
  proveedorController.mostrarEditar
);


// Actualizar proveedor
router.post(
  '/proveedores/editar/:id',
  requiereAutenticacion,
  proveedorController.actualizarProveedor
);


// Eliminar proveedor
router.post(
  '/proveedores/eliminar/:id',
  requiereAutenticacion,
  proveedorController.eliminarProveedor
);


module.exports = router;