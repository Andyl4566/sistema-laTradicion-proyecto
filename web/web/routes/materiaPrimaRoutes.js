const express = require('express');
const router = express.Router();

const materiaPrimaController =
  require('../controllers/materiaPrimaController');

const { permitirRoles } =
  require('../middleware/authMiddleware');

router.get(
  '/materia-prima',
  permitirRoles('administrador', 'produccion'),
  materiaPrimaController.listarMateriasPrimas
);

router.get(
  '/materia-prima/nueva',
  permitirRoles('administrador', 'produccion'),
  materiaPrimaController.mostrarCrear
);

router.post(
  '/materia-prima/nueva',
  permitirRoles('administrador', 'produccion'),
  materiaPrimaController.crearMateriaPrima
);

router.get(
  '/materia-prima/editar/:id',
  permitirRoles('administrador', 'produccion'),
  materiaPrimaController.mostrarEditar
);

router.post(
  '/materia-prima/editar/:id',
  permitirRoles('administrador', 'produccion'),
  materiaPrimaController.actualizarMateriaPrima
);

// El DELETE queda reservado al administrador.
router.post(
  '/materia-prima/eliminar/:id',
  permitirRoles('administrador'),
  materiaPrimaController.eliminarMateriaPrima
);

module.exports = router;