/**
 * Controlador: Proveedor
 *
 * Gestiona las operaciones CRUD del módulo de proveedores.
 */

const proveedorModel =
  require('../models/proveedorModel');


/**
 * Listar proveedores
 */
async function listarProveedores(req, res) {

  try {

    const proveedores =
      await proveedorModel.obtenerTodos();

    return res.render(
      'proveedores/index',
      {
        titulo: 'Proveedores',
        usuario: req.session.usuario,
        proveedores,
        mensaje: req.query.mensaje || null,
        error: req.query.error || null
      }
    );

  } catch (error) {

    console.error(
      '❌ Error listando proveedores:',
      error
    );

    return res.status(500).render(
      'error',
      {
        titulo: 'Error',
        mensajeError:
          'No se pudieron cargar los proveedores.'
      }
    );

  }

}


/**
 * Mostrar formulario de creación
 */
function mostrarCrear(req, res) {

  return res.render(
    'proveedores/formulario',
    {
      titulo: 'Nuevo Proveedor',
      usuario: req.session.usuario,
      proveedor: null,
      accion: '/proveedores/nuevo',
      textoBoton: 'Registrar Proveedor',
      error: null
    }
  );

}


/**
 * Crear proveedor
 */
async function crearProveedor(req, res) {

  try {

    const {
      nombre,
      telefono,
      correo
    } = req.body;


    if (!nombre || !nombre.trim()) {

      return res.status(400).render(
        'proveedores/formulario',
        {
          titulo: 'Nuevo Proveedor',
          usuario: req.session.usuario,

          proveedor: {
            NOMBRE: nombre,
            TELEFONO: telefono,
            CORREO: correo
          },

          accion: '/proveedores/nuevo',

          textoBoton:
            'Registrar Proveedor',

          error:
            'El nombre del proveedor es obligatorio.'
        }
      );

    }


    await proveedorModel.crear({
      nombre: nombre.trim(),
      telefono: telefono?.trim(),
      correo: correo?.trim()
    });


    return res.redirect(
      '/proveedores?mensaje=Proveedor registrado correctamente'
    );

  } catch (error) {

    console.error(
      '❌ Error creando proveedor:',
      error
    );

    return res.status(500).render(
      'proveedores/formulario',
      {
        titulo: 'Nuevo Proveedor',

        usuario:
          req.session.usuario,

        proveedor:
          req.body,

        accion:
          '/proveedores/nuevo',

        textoBoton:
          'Registrar Proveedor',

        error:
          'No se pudo registrar el proveedor.'
      }
    );

  }

}


/**
 * Mostrar formulario de edición
 */
async function mostrarEditar(req, res) {

  try {

    const proveedor =
      await proveedorModel.obtenerPorId(
        req.params.id
      );


    if (!proveedor) {

      return res.redirect(
        '/proveedores?error=Proveedor no encontrado'
      );

    }


    return res.render(
      'proveedores/formulario',
      {
        titulo: 'Editar Proveedor',

        usuario:
          req.session.usuario,

        proveedor,

        accion:
          `/proveedores/editar/${proveedor.ID_PROVEEDOR}`,

        textoBoton:
          'Guardar Cambios',

        error:
          req.query.error || null
      }
    );

  } catch (error) {

    console.error(
      '❌ Error buscando proveedor:',
      error
    );

    return res.redirect(
      '/proveedores?error=No se pudo cargar el proveedor'
    );

  }

}


/**
 * Actualizar proveedor
 */
async function actualizarProveedor(req, res) {

  try {

    const {
      nombre,
      telefono,
      correo
    } = req.body;


    if (!nombre || !nombre.trim()) {

      return res.redirect(
        `/proveedores/editar/${req.params.id}?error=El nombre es obligatorio`
      );

    }


    await proveedorModel.actualizar(
      req.params.id,
      {
        nombre: nombre.trim(),
        telefono: telefono?.trim(),
        correo: correo?.trim()
      }
    );


    return res.redirect(
      '/proveedores?mensaje=Proveedor actualizado correctamente'
    );

  } catch (error) {

    console.error(
      '❌ Error actualizando proveedor:',
      error
    );

    return res.redirect(
      '/proveedores?error=No se pudo actualizar el proveedor'
    );

  }

}


/**
 * Eliminar proveedor
 */
async function eliminarProveedor(req, res) {

  try {

    await proveedorModel.eliminar(
      req.params.id
    );


    return res.redirect(
      '/proveedores?mensaje=Proveedor eliminado correctamente'
    );

  } catch (error) {

    console.error(
      '❌ Error eliminando proveedor:',
      error
    );

    return res.redirect(
      '/proveedores?error=No se pudo eliminar el proveedor'
    );

  }

}


module.exports = {
  listarProveedores,
  mostrarCrear,
  crearProveedor,
  mostrarEditar,
  actualizarProveedor,
  eliminarProveedor
};