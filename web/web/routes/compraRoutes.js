const router=require('express').Router();
const ctrl=require('../controllers/compraController');
const {permitirRoles}=require('../middleware/authMiddleware');
router.get('/compras',permitirRoles('administrador'),ctrl.listar);
router.get('/compras/nueva',permitirRoles('administrador'),ctrl.nueva);
router.post('/compras/nueva',permitirRoles('administrador'),ctrl.crear);
router.post('/compras/:id/anular',permitirRoles('administrador'),ctrl.anular);
router.get('/compras/:id',permitirRoles('administrador'),ctrl.detalle);
module.exports=router;
