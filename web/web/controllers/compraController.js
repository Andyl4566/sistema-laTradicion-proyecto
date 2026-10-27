const model=require('../models/compraModel');
const redir=(res,key,msg)=>res.redirect('/compras?'+key+'='+encodeURIComponent(msg));
async function listar(req,res){try{const compras=await model.listar();res.render('compras/index',{titulo:'Compras',compras,mensaje:req.query.mensaje||null,error:req.query.error||null});}catch(e){console.error(e);res.status(500).render('error',{titulo:'Error',mensajeError:'No se pudieron consultar las compras.'});}}
async function formulario(req,res,datos={},error=null,status=200){try{const [proveedores,materias]=await Promise.all([model.proveedores(),model.materias()]);res.status(status).render('compras/formulario',{titulo:'Nueva Compra',proveedores,materias,datos,error});}catch(e){console.error(e);redir(res,'error','No se pudo abrir el formulario.');}}
async function nueva(req,res){return formulario(req,res);}
async function crear(req,res){const fallo=m=>formulario(req,res,req.body,m,400);try{
 const {fecha_compra,id_proveedor,materias_json}=req.body;
 if(typeof fecha_compra!=='string'||!/^\d{4}-\d{2}-\d{2}$/.test(fecha_compra)||Number.isNaN(Date.parse(fecha_compra+'T00:00:00Z')))return fallo('Indique una fecha válida.');
 const proveedor=Number(id_proveedor);if(!Number.isSafeInteger(proveedor)||proveedor<=0)return fallo('Seleccione un proveedor válido.');
 let items;try{items=JSON.parse(materias_json);}catch(e){return fallo('Detalle inválido.');}
 if(!Array.isArray(items)||items.length<1||items.length>500)return fallo('Agregue entre 1 y 500 materias primas.');
 const catalogo=new Set((await model.materias()).map(x=>Number(x.ID)));
 const usados=new Set();let total=0;
 for(const item of items){const id=Number(item.id_materia_prima),cant=Number(item.cantidad),precio=Number(item.precio_unitario);
 if(!Number.isSafeInteger(id)||!catalogo.has(id)||usados.has(id))return fallo('Materia prima inválida o repetida.');usados.add(id);
 if(!Number.isFinite(cant)||cant<=0||cant>99999999.99||Math.round(cant*100)!==cant*100 && Math.abs(Math.round(cant*100)-cant*100)>1e-7)return fallo('Cantidad inválida (máximo dos decimales).');
 if(!Number.isFinite(precio)||precio<0||precio>99999999.99||Math.abs(Math.round(precio*100)-precio*100)>1e-7)return fallo('Precio inválido (máximo dos decimales).');
 total+=Math.round(cant*100)*Math.round(precio*100)/10000;
 if(total>99999999.99)return fallo('El total excede el límite permitido.');
 }
 await model.registrar(fecha_compra,proveedor,items);
 return redir(res,'mensaje','Compra múltiple registrada correctamente.');
 }catch(e){console.error('Error compra:',e);return fallo('No se pudo registrar la compra. Revise los datos e intente nuevamente.');}}
async function detalle(req,res){const id=Number(req.params.id);if(!Number.isSafeInteger(id)||id<=0)return redir(res,'error','ID inválido.');try{const compras=await model.listar();const compra=compras.find(c=>Number(c.ID)===id);if(!compra)return redir(res,'error','Compra no encontrada.');const lineas=await model.detalle(id);return res.render('compras/detalle',{titulo:'Detalle de compra',compra,lineas});}catch(e){console.error(e);return redir(res,'error','No se pudo consultar el detalle.');}}
async function anular(req,res){
 const id=Number(req.params.id),motivo=typeof req.body.motivo==='string'?req.body.motivo.trim():'';
 if(!Number.isSafeInteger(id)||id<=0||motivo.length<5||motivo.length>500)return redir(res,'error','Indique un motivo válido de 5 a 500 caracteres.');
 try {await model.anular(id,motivo);return redir(res,'mensaje','Compra anulada; inventario descontado correctamente.');}
 catch(e){console.error('Error anulando compra:',e);return redir(res,'error','No se pudo anular la compra. Puede estar anulada o no existir suficiente inventario.');}
}
module.exports={listar,nueva,crear,detalle,anular};
