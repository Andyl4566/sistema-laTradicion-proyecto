const express = require('express');
const router = express.Router();

const clienteController =
  require('../controllers/clienteController');

/**
 * Middleware para proteger las rutas de clientes.
 */
function requiereAutenticacion(req, res, next) {
  if (!req.session || !req.session.usuario) {
    return res.redirect('/login');
  }

  next();
}

// Listar clientes
router.get(
  '/clientes',
  requiereAutenticacion,
  clienteController.listarClientes
);

// Formulario nuevo cliente
router.get(
  '/clientes/nuevo',
  requiereAutenticacion,
  clienteController.mostrarCrear
);

// Guardar nuevo cliente
router.post(
  '/clientes/nuevo',
  requiereAutenticacion,
  clienteController.crearCliente
);

// Formulario editar
router.get(
  '/clientes/editar/:id',
  requiereAutenticacion,
  clienteController.mostrarEditar
);

// Guardar edición
router.post(
  '/clientes/editar/:id',
  requiereAutenticacion,
  clienteController.actualizarCliente
);

// Eliminar
router.post(
  '/clientes/eliminar/:id',
  requiereAutenticacion,
  clienteController.eliminarCliente
);

module.exports = router;