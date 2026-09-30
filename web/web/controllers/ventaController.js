const ventaModel = require('../models/ventaModel');


/**
 * Lista las ventas registradas.
 */
async function listarVentas(req, res) {
  try {

    const ventas = await ventaModel.obtenerTodas();

    return res.render('ventas/index', {
      titulo: 'Ventas',
      usuario: req.session.usuario,
      ventas,
      mensaje: req.query.mensaje || null,
      error: req.query.error || null
    });

  } catch (error) {

    console.error('❌ Error listando ventas:', error);

    return res.status(500).render('error', {
      titulo: 'Error',
      mensajeError:
        'No se pudieron cargar las ventas.'
    });
  }
}


/**
 * Muestra el formulario de nueva venta.
 */
async function mostrarCrear(req, res) {
  try {

    const clientes =
      await ventaModel.obtenerClientes();

    const empleados =
      await ventaModel.obtenerEmpleados();

    const productos =
      await ventaModel.obtenerProductos();

    return res.render('ventas/formulario', {
      titulo: 'Nueva Venta',
      usuario: req.session.usuario,

      clientes,
      empleados,
      productos,

      datos: null,
      error: null
    });

  } catch (error) {

    console.error(
      '❌ Error cargando formulario de venta:',
      error
    );

    return res.redirect(
      '/ventas?error=No se pudo cargar el formulario'
    );
  }
}


/**
 * Registra una venta.
 */
async function crearVenta(req, res) {

  try {

    const {
      asunto,
      fecha_venta,
      id_cliente,
      id_empleado,
      id_producto,
      cantidad,
      precio_unitario
    } = req.body;


    // -------------------------
    // VALIDACIONES
    // -------------------------

    if (
      !asunto ||
      !fecha_venta ||
      !id_cliente ||
      !id_empleado ||
      !id_producto ||
      !cantidad ||
      !precio_unitario
    ) {

      return mostrarFormularioConError(
        req,
        res,
        'Todos los campos son obligatorios.'
      );
    }


    const cantidadNumero = Number(cantidad);
    const precioNumero = Number(precio_unitario);


    if (
      !Number.isInteger(cantidadNumero) ||
      cantidadNumero <= 0
    ) {

      return mostrarFormularioConError(
        req,
        res,
        'La cantidad debe ser mayor que cero.'
      );
    }


    if (
      !Number.isFinite(precioNumero) ||
      precioNumero <= 0
    ) {

      return mostrarFormularioConError(
        req,
        res,
        'El precio unitario debe ser mayor que cero.'
      );
    }


    // -------------------------
    // REGISTRAR VENTA
    // -------------------------

    await ventaModel.registrar({
      asunto: asunto.trim(),
      fecha_venta,
      id_cliente,
      id_empleado,
      id_producto,
      cantidad: cantidadNumero,
      precio_unitario: precioNumero
    });


    return res.redirect(
      '/ventas?mensaje=Venta registrada correctamente'
    );


  } catch (error) {

    console.error(
      '❌ Error registrando venta:',
      error
    );

    /*
     * No mostramos errores SQL crudos
     * al usuario.
     */

    return mostrarFormularioConError(
      req,
      res,
      'No se pudo registrar la venta. Verifica el stock disponible y los datos ingresados.'
    );
  }
}


/**
 * Vuelve a cargar el formulario conservando
 * los datos ingresados.
 */
async function mostrarFormularioConError(
  req,
  res,
  mensajeError
) {

  try {

    const clientes =
      await ventaModel.obtenerClientes();

    const empleados =
      await ventaModel.obtenerEmpleados();

    const productos =
      await ventaModel.obtenerProductos();


    return res.status(400).render(
      'ventas/formulario',
      {
        titulo: 'Nueva Venta',
        usuario: req.session.usuario,

        clientes,
        empleados,
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
      '/ventas?error=No se pudo cargar el formulario'
    );
  }
}


module.exports = {
  listarVentas,
  mostrarCrear,
  crearVenta
};