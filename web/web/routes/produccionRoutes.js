const express = require('express');
const router = express.Router();

const produccionController =
  require('../controllers/produccionController');

const { permitirRoles } =
  require('../middleware/authMiddleware');


router.get(
  '/produccion',
  permitirRoles('administrador', 'produccion'),
  produccionController.listarProducciones
);


router.get(
  '/produccion/nueva',
  permitirRoles('administrador', 'produccion'),
  produccionController.mostrarCrear
);


router.post(
  '/produccion/nueva',
  permitirRoles('administrador', 'produccion'),
  produccionController.crearProduccion
);


router.get('/produccion/:id', permitirRoles('administrador', 'produccion'), produccionController.verDetalle);
router.post('/produccion/:id/anular', permitirRoles('administrador', 'produccion'), produccionController.anularProduccion);

module.exports = router;
