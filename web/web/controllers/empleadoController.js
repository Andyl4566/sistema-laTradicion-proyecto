const model = require('../models/empleadoModel');
const fecha = x => x ? new Date(x).toISOString().slice(0,10) : '';
function normalizar(body) {
  const d = {
    nombre: String(body.nombre||'').trim(), dpi: String(body.dpi||'').trim(),
    telefono: String(body.telefono||'').trim() || null,
    salario: body.salario === '' || body.salario == null ? null : Number(body.salario),
    fecha_contratacion: body.fecha_contratacion || null,
    estado: body.estado === 'Inactivo' ? 'Inactivo' : 'Activo'
  };
  if (!d.nombre || d.nombre.length > 200 || !d.dpi || d.dpi.length > 100) throw new Error('Nombre y DPI son obligatorios.');
  if (d.salario !== null && (!Number.isFinite(d.salario) || d.salario < 0)) throw new Error('El salario debe ser un número mayor o igual a cero.');
  if (d.telefono && d.telefono.length > 50) throw new Error('El teléfono es demasiado largo.');
  if (d.fecha_contratacion && !/^\d{4}-\d{2}-\d{2}$/.test(d.fecha_contratacion)) throw new Error('Fecha inválida.');
  return d;
}
function mensajeError(e) {
  if (e.code === 'ER_DUP_ENTRY' || /Duplicate entry/.test(e.message)) return 'Ya existe un empleado con ese DPI.';
  return e.message.startsWith('Nombre y DPI') || e.message.startsWith('El salario') || e.message.startsWith('El teléfono') || e.message.startsWith('Fecha inválida') ? e.message : 'No se pudo completar la operación.';
}
async function listar(req,res) {
  try { return res.render('empleados/index', {titulo:'Empleados', empleados:await model.obtenerTodos(), mensaje:req.query.mensaje, error:req.query.error}); }
  catch(e) { console.error('Error empleados',e); return res.status(500).render('error',{titulo:'Error',mensajeError:'No se pudieron cargar los empleados.'}); }
}
function formulario(res, empleado=null, error=null) {
  const editar = Boolean(empleado && empleado.ID_EMPLEADO);
  return res.render('empleados/formulario', {titulo:editar?'Editar Empleado':'Nuevo Empleado', empleado, error, fecha, accion:editar?`/empleados/editar/${empleado.ID_EMPLEADO}`:'/empleados/nuevo'});
}
function nuevo(req,res) { return formulario(res); }
async function editar(req,res) {
  const empleado=await model.obtenerPorId(Number(req.params.id));
  if (!empleado) return res.redirect('/empleados?error=Empleado no encontrado');
  return formulario(res,empleado);
}
async function guardar(req,res) {
  const id=req.params.id ? Number(req.params.id) : null;
  try {
    const d=normalizar(req.body);
    if (id) { const r=await model.actualizar(id,d); if(!r.affectedRows) throw new Error('No se encontró el empleado.'); }
    else await model.crear(d);
    return res.redirect('/empleados?mensaje='+encodeURIComponent(id?'Empleado actualizado correctamente':'Empleado registrado correctamente'));
  } catch(e) {
    console.error('Error guardando empleado:',e);
    return formulario(res,{...req.body,ID_EMPLEADO:id, NOMBRE:req.body.nombre,DPI:req.body.dpi,TELEFONO:req.body.telefono,SALARIO:req.body.salario,FECHA_CONTRATACION:req.body.fecha_contratacion,ESTADO:req.body.estado},mensajeError(e));
  }
}
async function desactivar(req,res) {
  try { await model.desactivar(Number(req.params.id)); return res.redirect('/empleados?mensaje=Empleado desactivado correctamente'); }
  catch(e) {console.error('Error desactivando empleado:',e);return res.redirect('/empleados?error=No se pudo desactivar al empleado');}
}
module.exports={listar,nuevo,editar,guardar,desactivar};
