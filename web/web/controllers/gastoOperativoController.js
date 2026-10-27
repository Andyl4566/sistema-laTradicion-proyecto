const model = require('../models/gastoOperativoModel');
const fecha = x => x ? (x instanceof Date ? x.toISOString().slice(0,10) : String(x).slice(0,10)) : '';
const fechaValida = x => /^\d{4}-\d{2}-\d{2}$/.test(x) && !Number.isNaN(Date.parse(x)) && new Date(x+'T12:00:00Z').toISOString().slice(0,10) === x;
const mensajeError = e => e.message && e.message.startsWith('Validación:') ? e.message.replace('Validación:','') : 'No se pudo completar la operación. Revisa los datos e inténtalo de nuevo.';
function datos(b) {
 const d={descripcion:String(b.descripcion||'').trim(),motivo:String(b.motivo||'').trim(),fecha:String(b.fecha_gasto||''),monto:Number(b.monto),estado:String(b.estado||'Pendiente').trim()};
 if(!d.descripcion || d.descripcion.length>200) throw Error('Validación: La descripción es obligatoria (máximo 200 caracteres).');
 if(d.motivo.length>200) throw Error('Validación: El motivo debe tener como máximo 200 caracteres.');
 if(!fechaValida(d.fecha)) throw Error('Validación: Ingresa una fecha válida.');
 if(b.monto==='' || b.monto==null || !Number.isFinite(d.monto) || d.monto<0 || d.monto>99999999.99) throw Error('Validación: El monto debe estar entre Q0 y Q99,999,999.99.');
 if(!['Pagado','Pendiente','Anulado'].includes(d.estado)) throw Error('Validación: Estado no válido.');
 return d;
}
async function listar(req,res) {
 try {
  const filtros={busqueda:String(req.query.busqueda||'').trim().slice(0,100),categoria:String(req.query.categoria||'').trim().slice(0,200),desde:String(req.query.desde||''),hasta:String(req.query.hasta||'')};
  if((filtros.desde&&!fechaValida(filtros.desde))||(filtros.hasta&&!fechaValida(filtros.hasta))) throw Error('Fecha de filtro inválida');
  const data=await model.listar(filtros);
  return res.render('gastos-operativos/index',{titulo:'Gastos Operativos',...data,filtros,fecha,mensaje:req.query.mensaje||null,error:req.query.error||null});
 }catch(e){console.error('Error listando gastos:',e);return res.status(500).render('error',{titulo:'Error',mensajeError:'No se pudieron consultar los gastos operativos.'});}
}
function form(res,gasto=null,error=null){return res.render('gastos-operativos/formulario',{titulo:gasto&&gasto.ID?'Editar Gasto':'Nuevo Gasto',gasto,error,fecha,accion:gasto&&gasto.ID?`/gastos-operativos/editar/${gasto.ID}`:'/gastos-operativos/nuevo'});}
function nuevo(req,res){return form(res);}
async function editar(req,res){try{const g=await model.porId(Number(req.params.id));if(!g)return res.redirect('/gastos-operativos?error=Gasto no encontrado');return form(res,g);}catch(e){console.error(e);return res.redirect('/gastos-operativos?error=No se pudo cargar el gasto');}}
async function guardar(req,res){const id=req.params.id?Number(req.params.id):null;try{const d=datos(req.body);if(id){const r=await model.actualizar(id,d);if(!r.affectedRows)throw Error('Validación: Gasto no encontrado.');}else await model.crear(d);return res.redirect('/gastos-operativos?mensaje='+encodeURIComponent(id?'Gasto actualizado correctamente':'Gasto registrado correctamente'));}catch(e){console.error('Error guardando gasto:',e);return form(res,{ID:id,DESCRIPCION:req.body.descripcion,MOTIVO:req.body.motivo,FECHA:req.body.fecha_gasto,MONTO:req.body.monto,ESTADO:req.body.estado},mensajeError(e));}}
async function eliminar(req,res){try{const r=await model.eliminar(Number(req.params.id));return res.redirect('/gastos-operativos?'+(r.affectedRows?'mensaje=Gasto eliminado correctamente':'error=Gasto no encontrado'));}catch(e){console.error('Error eliminando gasto:',e);return res.redirect('/gastos-operativos?error=No se pudo eliminar el gasto');}}
module.exports={listar,nuevo,editar,guardar,eliminar};
