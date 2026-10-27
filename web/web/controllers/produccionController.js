const produccionModel =
  require('../models/produccionModel');


/**
 * Muestra el historial de producción.
 */
async function listarProducciones(req, res) {
  try {

    const producciones =
      await produccionModel.obtenerTodas();

    const agrupadas = new Map();
    for (const fila of producciones) {
      if (!agrupadas.has(fila.ID_PRODUCCION)) {
        agrupadas.set(fila.ID_PRODUCCION, { ...fila, ITEMS: [] });
      }
      agrupadas.get(fila.ID_PRODUCCION).ITEMS.push({
        nombre: fila.PRODUCTO, cantidad: fila.CANTIDAD_PRODUCIDA
      });
    }

    return res.render('produccion/index', {
      titulo: 'Producción',
      usuario: req.session.usuario,
      producciones: [...agrupadas.values()],
      mensaje: req.query.mensaje || null,
      error: req.query.error || null
    });

  } catch (error) {

    console.error(
      '❌ Error listando producciones:',
      error
    );

    return res.status(500).render('error', {
      titulo: 'Error',
      mensajeError:
        'No se pudo cargar el historial de producción.'
    });
  }
}


/**
 * Muestra el formulario para registrar producción.
 */
async function mostrarCrear(req, res) {
  try {

    const [productos, recetas] = await Promise.all([
      produccionModel.obtenerProductos(),
      produccionModel.obtenerRecetasDisponibles()
    ]);

    return res.render('produccion/formulario', {
      titulo: 'Nueva Producción',
      usuario: req.session.usuario,
      productos,
      recetas,
      datos: null,
      error: null
    });

  } catch (error) {

    console.error(
      '❌ Error cargando formulario:',
      error
    );

    return res.redirect(
      '/produccion?error=No se pudo cargar el formulario'
    );
  }
}


/**
 * Registra una nueva producción.
 */
async function crearProduccion(req, res) {
  try {
    const { nombre, descripcion, fecha_produccion, productos_json } = req.body;
    let productos;
    try { productos = JSON.parse(productos_json); } catch (_) { productos = null; }
    if (typeof nombre !== 'string' || !nombre.trim() || nombre.trim().length > 200 ||
        typeof fecha_produccion !== 'string' || !/^\d{4}-\d{2}-\d{2}$/.test(fecha_produccion) ||
        !Array.isArray(productos) || !productos.length || productos.length > 100) {
      return mostrarFormularioConError(req, res, 'Completa los campos y agrega productos válidos.');
    }
    const ids = new Set();
    for (const item of productos) {
      if (!item || !Number.isSafeInteger(item.id_producto) || item.id_producto <= 0 ||
          !Number.isSafeInteger(item.cantidad) || item.cantidad <= 0 ||
          item.cantidad > 2147483647 || ids.has(item.id_producto)) {
        return mostrarFormularioConError(req, res, 'Hay cantidades o productos inválidos o repetidos.');
      }
      ids.add(item.id_producto);
    }
    await produccionModel.registrarMultiple({
      nombre: nombre.trim(),
      descripcion: typeof descripcion === 'string' ? descripcion.trim().slice(0, 200) : null,
      fecha_produccion, productos
    });
    return res.redirect('/produccion?mensaje=' + encodeURIComponent('Producción múltiple registrada correctamente'));
  } catch (error) {
    console.error('Error registrando producción múltiple:', error);
    return mostrarFormularioConError(req, res,
      'No se pudo registrar. Revisa recetas, existencias de materias primas y cantidades.');
  }
}

/**
 * Recarga el formulario conservando
 * la información ingresada.
 */
async function mostrarFormularioConError(
  req,
  res,
  mensajeError
) {

  try {

    const [productos, recetas] = await Promise.all([
      produccionModel.obtenerProductos(),
      produccionModel.obtenerRecetasDisponibles()
    ]);

    return res.status(400).render(
      'produccion/formulario',
      {
        titulo: 'Nueva Producción',
        usuario: req.session.usuario,
        productos,
        recetas,
        datos: req.body,
        error: mensajeError
      }
    );

  } catch (error) {

    console.error(
      '❌ Error recargando formulario:',
      error
    );

    return res.redirect(
      '/produccion?error=No se pudo cargar el formulario'
    );
  }
}


async function verDetalle(req, res) {
  try {
    const id = Number(req.params.id);
    if (!Number.isSafeInteger(id) || id <= 0) return res.redirect('/produccion?error=ID inválido');
    const detalle = await produccionModel.obtenerDetalle(id);
    if (!detalle) return res.redirect('/produccion?error=Producción no encontrada');
    return res.render('produccion/detalle', {
      titulo: 'Detalle de Producción',
      usuario: req.session.usuario,
      ...detalle
    });
  } catch (error) {
    console.error('Error consultando producción:', error);
    return res.redirect('/produccion?error=No se pudo consultar la producción');
  }
}

async function anularProduccion(req, res) {
  const id = Number(req.params.id);
  const motivo = String(req.body.motivo || '').trim();
  if (!Number.isSafeInteger(id) || id <= 0 || motivo.length < 5 || motivo.length > 500) {
    return res.redirect('/produccion?error=' + encodeURIComponent('ID o motivo de anulación inválido'));
  }
  try {
    await produccionModel.anular(id, motivo);
    return res.redirect('/produccion?mensaje=' + encodeURIComponent('Producción anulada; inventario restaurado correctamente'));
  } catch (error) {
    console.error('Error anulando producción:', error);
    return res.redirect('/produccion?error=' + encodeURIComponent('No se pudo anular la producción. Puede estar anulada, no tener consumos verificables o faltar inventario de producto terminado.'));
  }
}

module.exports = {
  listarProducciones,
  mostrarCrear,
  crearProduccion,
  verDetalle,
  anularProduccion
};
