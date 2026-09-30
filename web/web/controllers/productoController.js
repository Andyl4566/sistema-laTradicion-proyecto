const productoModel = require('../models/productoModel');

/**
 * Lista todos los productos.
 */
async function listarProductos(req, res) {
  try {
    const productos = await productoModel.obtenerTodos();

    return res.render('productos/index', {
      titulo: 'Productos',
      usuario: req.session.usuario,
      productos,
      mensaje: req.query.mensaje || null,
      error: req.query.error || null
    });

  } catch (error) {
    console.error('❌ Error listando productos:', error);

    return res.status(500).render('error', {
      titulo: 'Error',
      mensajeError: 'No se pudieron cargar los productos.'
    });
  }
}

/**
 * Muestra el formulario para crear un producto.
 */
function mostrarCrear(req, res) {
  return res.render('productos/formulario', {
    titulo: 'Nuevo Producto',
    usuario: req.session.usuario,
    producto: null,
    accion: '/productos/nuevo',
    textoBoton: 'Registrar Producto',
    error: null
  });
}

/**
 * Guarda un nuevo producto.
 */
async function crearProducto(req, res) {
  try {
    const {
      nombre,
      descripcion,
      unidades,
      precio_unitario
    } = req.body;

    if (!nombre || !nombre.trim()) {
      return res.status(400).render('productos/formulario', {
        titulo: 'Nuevo Producto',
        usuario: req.session.usuario,
        producto: req.body,
        accion: '/productos/nuevo',
        textoBoton: 'Registrar Producto',
        error: 'El nombre del producto es obligatorio.'
      });
    }

    const unidadesNumero = Number(unidades);
    const precioNumero = Number(precio_unitario);

    if (
      !Number.isFinite(unidadesNumero) ||
      unidadesNumero < 0
    ) {
      return res.status(400).render('productos/formulario', {
        titulo: 'Nuevo Producto',
        usuario: req.session.usuario,
        producto: req.body,
        accion: '/productos/nuevo',
        textoBoton: 'Registrar Producto',
        error: 'Las unidades deben ser un número mayor o igual a 0.'
      });
    }

    if (
      !Number.isFinite(precioNumero) ||
      precioNumero < 0
    ) {
      return res.status(400).render('productos/formulario', {
        titulo: 'Nuevo Producto',
        usuario: req.session.usuario,
        producto: req.body,
        accion: '/productos/nuevo',
        textoBoton: 'Registrar Producto',
        error: 'El precio debe ser un número mayor o igual a 0.'
      });
    }

    await productoModel.crear({
      nombre: nombre.trim(),
      descripcion: descripcion?.trim(),
      unidades: unidadesNumero,
      precio_unitario: precioNumero
    });

    return res.redirect(
      '/productos?mensaje=Producto registrado correctamente'
    );

  } catch (error) {
    console.error('❌ Error creando producto:', error);

    return res.status(500).render('productos/formulario', {
      titulo: 'Nuevo Producto',
      usuario: req.session.usuario,
      producto: req.body,
      accion: '/productos/nuevo',
      textoBoton: 'Registrar Producto',
      error: 'No se pudo registrar el producto.'
    });
  }
}

/**
 * Muestra el formulario para editar un producto.
 */
async function mostrarEditar(req, res) {
  try {
    const producto =
      await productoModel.obtenerPorId(req.params.id);

    if (!producto) {
      return res.redirect(
        '/productos?error=Producto no encontrado'
      );
    }

    return res.render('productos/formulario', {
      titulo: 'Editar Producto',
      usuario: req.session.usuario,
      producto,
      accion: `/productos/editar/${producto.ID_PRODUCTO}`,
      textoBoton: 'Guardar Cambios',
      error: null
    });

  } catch (error) {
    console.error('❌ Error buscando producto:', error);

    return res.redirect(
      '/productos?error=No se pudo cargar el producto'
    );
  }
}

/**
 * Actualiza un producto.
 */
async function actualizarProducto(req, res) {
  try {
    const {
      nombre,
      descripcion,
      unidades,
      precio_unitario
    } = req.body;

    const unidadesNumero = Number(unidades);
    const precioNumero = Number(precio_unitario);

    if (!nombre || !nombre.trim()) {
      return res.redirect(
        `/productos/editar/${req.params.id}?error=El nombre es obligatorio`
      );
    }

    if (
      !Number.isFinite(unidadesNumero) ||
      unidadesNumero < 0
    ) {
      return res.redirect(
        `/productos/editar/${req.params.id}?error=Las unidades no son válidas`
      );
    }

    if (
      !Number.isFinite(precioNumero) ||
      precioNumero < 0
    ) {
      return res.redirect(
        `/productos/editar/${req.params.id}?error=El precio no es válido`
      );
    }

    await productoModel.actualizar(
      req.params.id,
      {
        nombre: nombre.trim(),
        descripcion: descripcion?.trim(),
        unidades: unidadesNumero,
        precio_unitario: precioNumero
      }
    );

    return res.redirect(
      '/productos?mensaje=Producto actualizado correctamente'
    );

  } catch (error) {
    console.error('❌ Error actualizando producto:', error);

    return res.redirect(
      '/productos?error=No se pudo actualizar el producto'
    );
  }
}

/**
 * Elimina un producto.
 */
async function eliminarProducto(req, res) {
  try {
    await productoModel.eliminar(req.params.id);

    return res.redirect(
      '/productos?mensaje=Producto eliminado correctamente'
    );

  } catch (error) {
    console.error('❌ Error eliminando producto:', error);

    /*
     * Si el producto tiene ventas, producciones o materias primas
     * relacionadas, MySQL puede impedir su eliminación por las FK
     * configuradas con RESTRICT.
     */
    if (error.code === 'ER_ROW_IS_REFERENCED_2') {
      return res.redirect(
        '/productos?error=No se puede eliminar el producto porque tiene registros relacionados'
      );
    }

    return res.redirect(
      '/productos?error=No se pudo eliminar el producto'
    );
  }
}

module.exports = {
  listarProductos,
  mostrarCrear,
  crearProducto,
  mostrarEditar,
  actualizarProducto,
  eliminarProducto
};