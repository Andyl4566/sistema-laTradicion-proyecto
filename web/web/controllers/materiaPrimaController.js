const materiaPrimaModel =
  require('../models/materiaPrimaModel');

/**
 * Lista todas las materias primas.
 */
async function listarMateriasPrimas(req, res) {
  try {
    const materiasPrimas =
      await materiaPrimaModel.obtenerTodas();

    return res.render('materia-prima/index', {
      titulo: 'Materia Prima',
      usuario: req.session.usuario,
      materiasPrimas,
      mensaje: req.query.mensaje || null,
      error: req.query.error || null
    });

  } catch (error) {
    console.error('❌ Error listando materia prima:', error);

    return res.status(500).render('error', {
      titulo: 'Error',
      mensajeError:
        'No se pudo cargar la materia prima.'
    });
  }
}

/**
 * Muestra formulario de registro.
 */
function mostrarCrear(req, res) {
  return res.render('materia-prima/formulario', {
    titulo: 'Nueva Materia Prima',
    usuario: req.session.usuario,
    materiaPrima: null,
    accion: '/materia-prima/nueva',
    textoBoton: 'Registrar Materia Prima',
    error: null
  });
}

/**
 * Registra materia prima.
 */
async function crearMateriaPrima(req, res) {
  try {
    const {
      nombre,
      descripcion,
      cantidad,
      costo
    } = req.body;

    const cantidadNumero = Number(cantidad);

    const costoNumero =
      costo === '' ? null : Number(costo);

    if (!nombre || !nombre.trim()) {
      return res.status(400).render(
        'materia-prima/formulario',
        {
          titulo: 'Nueva Materia Prima',
          usuario: req.session.usuario,
          materiaPrima: req.body,
          accion: '/materia-prima/nueva',
          textoBoton: 'Registrar Materia Prima',
          error: 'El nombre es obligatorio.'
        }
      );
    }

    if (
      !Number.isFinite(cantidadNumero) ||
      cantidadNumero < 0
    ) {
      return res.status(400).render(
        'materia-prima/formulario',
        {
          titulo: 'Nueva Materia Prima',
          usuario: req.session.usuario,
          materiaPrima: req.body,
          accion: '/materia-prima/nueva',
          textoBoton: 'Registrar Materia Prima',
          error:
            'La cantidad debe ser mayor o igual a 0.'
        }
      );
    }

    if (
      costoNumero !== null &&
      (!Number.isFinite(costoNumero) ||
       costoNumero < 0)
    ) {
      return res.status(400).render(
        'materia-prima/formulario',
        {
          titulo: 'Nueva Materia Prima',
          usuario: req.session.usuario,
          materiaPrima: req.body,
          accion: '/materia-prima/nueva',
          textoBoton: 'Registrar Materia Prima',
          error: 'El costo ingresado no es válido.'
        }
      );
    }

    await materiaPrimaModel.crear({
      nombre: nombre.trim(),
      descripcion: descripcion?.trim(),
      cantidad: cantidadNumero,
      costo: costoNumero
    });

    return res.redirect(
      '/materia-prima?mensaje=Materia prima registrada correctamente'
    );

  } catch (error) {
    console.error(
      '❌ Error creando materia prima:',
      error
    );

    return res.status(500).render(
      'materia-prima/formulario',
      {
        titulo: 'Nueva Materia Prima',
        usuario: req.session.usuario,
        materiaPrima: req.body,
        accion: '/materia-prima/nueva',
        textoBoton: 'Registrar Materia Prima',
        error:
          'No se pudo registrar la materia prima.'
      }
    );
  }
}

/**
 * Muestra formulario de edición.
 */
async function mostrarEditar(req, res) {
  try {
    const materiaPrima =
      await materiaPrimaModel.obtenerPorId(
        req.params.id
      );

    if (!materiaPrima) {
      return res.redirect(
        '/materia-prima?error=Materia prima no encontrada'
      );
    }

    return res.render(
      'materia-prima/formulario',
      {
        titulo: 'Editar Materia Prima',
        usuario: req.session.usuario,
        materiaPrima,
        accion:
          `/materia-prima/editar/${materiaPrima.ID_MATERIA_PRIMA}`,
        textoBoton: 'Guardar Cambios',
        error: null
      }
    );

  } catch (error) {
    console.error(
      '❌ Error buscando materia prima:',
      error
    );

    return res.redirect(
      '/materia-prima?error=No se pudo cargar la materia prima'
    );
  }
}

/**
 * Actualiza materia prima.
 */
async function actualizarMateriaPrima(req, res) {
  try {
    const {
      nombre,
      descripcion,
      cantidad,
      costo
    } = req.body;

    const cantidadNumero = Number(cantidad);

    const costoNumero =
      costo === '' ? null : Number(costo);

    if (!nombre || !nombre.trim()) {
      return res.redirect(
        `/materia-prima/editar/${req.params.id}?error=El nombre es obligatorio`
      );
    }

    if (
      !Number.isFinite(cantidadNumero) ||
      cantidadNumero < 0
    ) {
      return res.redirect(
        `/materia-prima/editar/${req.params.id}?error=La cantidad no es válida`
      );
    }

    if (
      costoNumero !== null &&
      (!Number.isFinite(costoNumero) ||
       costoNumero < 0)
    ) {
      return res.redirect(
        `/materia-prima/editar/${req.params.id}?error=El costo no es válido`
      );
    }

    await materiaPrimaModel.actualizar(
      req.params.id,
      {
        nombre: nombre.trim(),
        descripcion: descripcion?.trim(),
        cantidad: cantidadNumero,
        costo: costoNumero
      }
    );

    return res.redirect(
      '/materia-prima?mensaje=Materia prima actualizada correctamente'
    );

  } catch (error) {
    console.error(
      '❌ Error actualizando materia prima:',
      error
    );

    return res.redirect(
      '/materia-prima?error=No se pudo actualizar la materia prima'
    );
  }
}

/**
 * Elimina materia prima.
 */
async function eliminarMateriaPrima(req, res) {
  try {
    await materiaPrimaModel.eliminar(
      req.params.id
    );

    return res.redirect(
      '/materia-prima?mensaje=Materia prima eliminada correctamente'
    );

  } catch (error) {
    console.error(
      '❌ Error eliminando materia prima:',
      error
    );

    if (error.code === 'ER_ROW_IS_REFERENCED_2') {
      return res.redirect(
        '/materia-prima?error=No se puede eliminar la materia prima porque tiene registros relacionados'
      );
    }

    return res.redirect(
      '/materia-prima?error=No se pudo eliminar la materia prima'
    );
  }
}

module.exports = {
  listarMateriasPrimas,
  mostrarCrear,
  crearMateriaPrima,
  mostrarEditar,
  actualizarMateriaPrima,
  eliminarMateriaPrima
};