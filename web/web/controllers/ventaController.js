const ventaModel = require('../models/ventaModel');

async function listarVentas(req, res) {
  try {
    const texto = valor => typeof valor === 'string' ? valor.trim().slice(0, 100) : '';
    const fecha = valor => typeof valor === 'string' && /^\d{4}-\d{2}-\d{2}$/.test(valor) &&
      !Number.isNaN(Date.parse(valor)) ? valor : '';
    const filtros = {
      busqueda: texto(req.query.busqueda),
      estado: ['ACTIVA', 'ANULADA'].includes(req.query.estado) ? req.query.estado : '',
      desde: fecha(req.query.desde), hasta: fecha(req.query.hasta)
    };
    const ventas = await ventaModel.obtenerTodas(filtros);
    const totalActivo = ventas.reduce((s, v) => s + (v.ESTADO === 'ACTIVA' ? Math.round(Number(v.MONTO) * 100) : 0), 0) / 100;
    return res.render('ventas/index', { titulo: 'Ventas', usuario: req.session.usuario,
      ventas, filtros, totalActivo, mensaje: req.query.mensaje || null, error: req.query.error || null });
  } catch (error) {
    console.error('Error listando ventas:', error);
    return res.status(500).render('error', { titulo: 'Error', mensajeError: 'No se pudieron cargar las ventas.' });
  }
}

async function renderFormulario(req, res, datos = null, error = null, status = 200) {
  try {
    const [clientes, empleados, productos] = await Promise.all([
      ventaModel.obtenerClientes(), ventaModel.obtenerEmpleados(), ventaModel.obtenerProductos()
    ]);
    return res.status(status).render('ventas/formulario', {
      titulo: 'Nueva Venta', usuario: req.session.usuario, clientes, empleados, productos, datos, error
    });
  } catch (err) {
    console.error('Error cargando formulario:', err);
    return res.redirect('/ventas?error=No se pudo cargar el formulario');
  }
}
async function mostrarCrear(req, res) { return renderFormulario(req, res); }

async function crearVenta(req, res) {
  const fallar = mensaje => renderFormulario(req, res, req.body, mensaje, 400);
  try {
    const { asunto, fecha_venta, id_cliente, id_empleado, productos_json } = req.body;
    if (typeof asunto !== 'string' || !asunto.trim() || asunto.trim().length > 200 ||
        typeof fecha_venta !== 'string' || !/^\d{4}-\d{2}-\d{2}$/.test(fecha_venta))
      return fallar('Ingrese un asunto y una fecha válidos.');
    const cliente = Number(id_cliente), empleado = Number(id_empleado);
    if (![cliente, empleado].every(n => Number.isSafeInteger(n) && n > 0))
      return fallar('Seleccione un cliente y un empleado válidos.');
    let items;
    try { items = JSON.parse(productos_json); } catch (_) { return fallar('El detalle de productos no es válido.'); }
    if (!Array.isArray(items) || items.length < 1 || items.length > 500)
      return fallar('Agregue entre 1 y 500 líneas de productos por venta.');
    const productosDisponibles = await ventaModel.obtenerProductos();
    const catalogo = new Map(productosDisponibles.map(p => [Number(p.ID_PRODUCTO), p]));
    const agrupados = new Map();
    for (const item of items) {
      const id = Number(item.id_producto), cantidad = Number(item.cantidad);
      if (!Number.isSafeInteger(id) || id <= 0 || !Number.isSafeInteger(cantidad) || cantidad <= 0)
        return fallar('Todos los productos deben tener una cantidad entera mayor que cero.');
      const producto = catalogo.get(id);
      if (!producto) return fallar('Uno de los productos seleccionados no existe.');
      const suma = (agrupados.get(id) || 0) + cantidad;
      if (!Number.isSafeInteger(suma) || suma > 2147483647)
        return fallar('La cantidad indicada es demasiado grande.');
      agrupados.set(id, suma);
    }
    const detalles = [];
    for (const [id, cantidad] of agrupados) {
      const producto = catalogo.get(id);
      if (cantidad > Number(producto.UNIDADES))
        return fallar('No hay suficiente inventario de ' + producto.NOMBRE + '.');
      const precio = Number(producto.PRECIO_UNITARIO);
      if (!Number.isFinite(precio) || precio < 0 || precio > 99999999.99)
        return fallar('Precio inválido en el catálogo.');
      detalles.push({ id_producto: id, cantidad, precio_unitario: precio.toFixed(2) });
    }
    const totalCentavos = detalles.reduce((acc, p) => acc + Math.round(Number(p.precio_unitario) * 100) * p.cantidad, 0);
    if (!Number.isSafeInteger(totalCentavos) || totalCentavos > 9999999999)
      return fallar('El total excede el monto máximo permitido.');
    await ventaModel.registrar({ asunto: asunto.trim(), fecha_venta, id_cliente: cliente,
      id_empleado: empleado, productos: detalles });
    return res.redirect('/ventas?mensaje=' + encodeURIComponent('Venta registrada correctamente'));
  } catch (error) {
    console.error('Error registrando venta:', error);
    return fallar('No se pudo registrar la venta. Verifique existencias y datos; vuelva a intentarlo.');
  }
}
async function anularVenta(req, res) {
  const id = Number(req.params.id);
  const motivo = typeof req.body.motivo === 'string' ? req.body.motivo.trim() : '';
  if (!Number.isSafeInteger(id) || id <= 0 || motivo.length < 5 || motivo.length > 500) {
    return res.redirect('/ventas?error=' + encodeURIComponent('Indique un motivo válido de 5 a 500 caracteres.'));
  }
  try {
    await ventaModel.anular(id, motivo);
    return res.redirect('/ventas?mensaje=' + encodeURIComponent('Venta anulada; inventario restituido correctamente.'));
  } catch (error) {
    console.error('Error anulando venta:', error);
    return res.redirect('/ventas?error=' + encodeURIComponent('No se pudo anular la venta. Compruebe que existe y sigue activa.'));
  }
}
module.exports = { listarVentas, mostrarCrear, crearVenta, anularVenta };
