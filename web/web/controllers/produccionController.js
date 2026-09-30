const produccionModel =
  require('../models/produccionModel');


/**
 * Muestra el historial de producción.
 */
async function listarProducciones(req, res) {
  try {

    const producciones =
      await produccionModel.obtenerTodas();

    return res.render('produccion/index', {
      titulo: 'Producción',
      usuario: req.session.usuario,
      producciones,
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

    const productos =
      await produccionModel.obtenerProductos();

    return res.render('produccion/formulario', {
      titulo: 'Nueva Producción',
      usuario: req.session.usuario,
      productos,
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

    const {
      nombre,
      descripcion,
      fecha_produccion,
      id_producto,
      cantidad_producida
    } = req.body;


    if (
      !nombre ||
      !fecha_produccion ||
      !id_producto ||
      !cantidad_producida
    ) {

      return mostrarFormularioConError(
        req,
        res,
        'Completa todos los campos obligatorios.'
      );
    }


    const cantidad =
      Number(cantidad_producida);


    if (
      !Number.isInteger(cantidad) ||
      cantidad <= 0
    ) {

      return mostrarFormularioConError(
        req,
        res,
        'La cantidad producida debe ser mayor que cero.'
      );
    }


    await produccionModel.registrar({
      nombre: nombre.trim(),
      descripcion: descripcion?.trim(),
      fecha_produccion,
      id_producto,
      cantidad_producida: cantidad
    });


    return res.redirect(
      '/produccion?mensaje=Producción registrada correctamente'
    );


  } catch (error) {

    console.error(
      '❌ Error registrando producción:',
      error
    );

    return mostrarFormularioConError(
      req,
      res,
      'No se pudo registrar la producción. Verifica que el producto tenga una receta y suficiente materia prima.'
    );
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

    const productos =
      await produccionModel.obtenerProductos();

    return res.status(400).render(
      'produccion/formulario',
      {
        titulo: 'Nueva Producción',
        usuario: req.session.usuario,
        productos,
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


module.exports = {
  listarProducciones,
  mostrarCrear,
  crearProduccion
};