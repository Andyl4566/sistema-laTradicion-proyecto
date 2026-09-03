const clienteModel = require('../models/clienteModel');

/**
 * Lista todos los clientes.
 */
async function listarClientes(req, res) {
  try {
    const clientes = await clienteModel.obtenerTodos();

    return res.render('clientes/index', {
      titulo: 'Clientes',
      usuario: req.session.usuario,
      clientes,
      mensaje: req.query.mensaje || null,
      error: req.query.error || null
    });

  } catch (error) {
    console.error('❌ Error listando clientes:', error);

    return res.status(500).render('error', {
      titulo: 'Error',
      mensajeError: 'No se pudieron cargar los clientes.'
    });
  }
}

/**
 * Muestra formulario para crear cliente.
 */
function mostrarCrear(req, res) {
  return res.render('clientes/formulario', {
    titulo: 'Nuevo Cliente',
    usuario: req.session.usuario,
    cliente: null,
    accion: '/clientes/nuevo',
    textoBoton: 'Registrar Cliente',
    error: null
  });
}

/**
 * Guarda un nuevo cliente.
 */
async function crearCliente(req, res) {
  try {
    const {
      nombre,
      telefono,
      correo,
      direccion
    } = req.body;

    if (!nombre || !nombre.trim()) {
      return res.status(400).render(
        'clientes/formulario',
        {
          titulo: 'Nuevo Cliente',
          usuario: req.session.usuario,
          cliente: {
            NOMBRE: nombre,
            TELEFONO: telefono,
            CORREO: correo,
            DIRECCION: direccion
          },
          accion: '/clientes/nuevo',
          textoBoton: 'Registrar Cliente',
          error: 'El nombre del cliente es obligatorio.'
        }
      );
    }

    await clienteModel.crear({
      nombre: nombre.trim(),
      telefono: telefono?.trim(),
      correo: correo?.trim(),
      direccion: direccion?.trim()
    });

    return res.redirect(
      '/clientes?mensaje=Cliente registrado correctamente'
    );

  } catch (error) {
    console.error('❌ Error creando cliente:', error);

    return res.status(500).render(
      'clientes/formulario',
      {
        titulo: 'Nuevo Cliente',
        usuario: req.session.usuario,
        cliente: req.body,
        accion: '/clientes/nuevo',
        textoBoton: 'Registrar Cliente',
        error: 'No se pudo registrar el cliente.'
      }
    );
  }
}

/**
 * Muestra formulario para editar.
 */
async function mostrarEditar(req, res) {
  try {
    const cliente =
      await clienteModel.obtenerPorId(req.params.id);

    if (!cliente) {
      return res.redirect(
        '/clientes?error=Cliente no encontrado'
      );
    }

    return res.render('clientes/formulario', {
      titulo: 'Editar Cliente',
      usuario: req.session.usuario,
      cliente,
      accion: `/clientes/editar/${cliente.ID_CLIENTE}`,
      textoBoton: 'Guardar Cambios',
      error: null
    });

  } catch (error) {
    console.error('❌ Error buscando cliente:', error);

    return res.redirect(
      '/clientes?error=No se pudo cargar el cliente'
    );
  }
}

/**
 * Actualiza un cliente.
 */
async function actualizarCliente(req, res) {
  try {
    const {
      nombre,
      telefono,
      correo,
      direccion
    } = req.body;

    if (!nombre || !nombre.trim()) {
      return res.redirect(
        `/clientes/editar/${req.params.id}?error=El nombre es obligatorio`
      );
    }

    await clienteModel.actualizar(
      req.params.id,
      {
        nombre: nombre.trim(),
        telefono: telefono?.trim(),
        correo: correo?.trim(),
        direccion: direccion?.trim()
      }
    );

    return res.redirect(
      '/clientes?mensaje=Cliente actualizado correctamente'
    );

  } catch (error) {
    console.error('❌ Error actualizando cliente:', error);

    return res.redirect(
      '/clientes?error=No se pudo actualizar el cliente'
    );
  }
}

/**
 * Elimina un cliente.
 */
async function eliminarCliente(req, res) {
  try {
    await clienteModel.eliminar(req.params.id);

    return res.redirect(
      '/clientes?mensaje=Cliente eliminado correctamente'
    );

  } catch (error) {
    console.error('❌ Error eliminando cliente:', error);

    return res.redirect(
      '/clientes?error=No se pudo eliminar el cliente'
    );
  }
}

module.exports = {
  listarClientes,
  mostrarCrear,
  crearCliente,
  mostrarEditar,
  actualizarCliente,
  eliminarCliente
};