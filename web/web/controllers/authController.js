/**
 * Controlador: Autenticación (authController)
 *
 * Gestiona la lógica de negocio para login y autenticación.
 * Implementa manejo limpio de errores sin exponer detalles de BD.
 */

const userModel = require('../models/userModel');
const bcrypt = require('bcryptjs');

/**
 * Muestra el formulario de login
 */
function mostrarLogin(req, res) {
  try {
    console.log('→ Mostrando página de login');

    // Si ya inició sesión, ir al home
    if (req.session && req.session.usuario) {
      return res.redirect('/home');
    }

    return res.render('login', {
      layout: false,
      titulo: 'Iniciar Sesión - Empresa de Tortillas, Nachos y Harina',
      mensajeError: req.query.error || null
    });

  } catch (error) {
    console.error('❌ Error mostrarLogin:', error);

    return res.status(500).send(
      'Error al cargar la página de login'
    );
  }
}

/**
 * Procesa el login del usuario
 */
async function procesarLogin(req, res) {
  try {
    const { nombreUsuario, password } = req.body;

    // Validación básica
    if (!nombreUsuario || !password) {
      return res.status(400).render('login', {
        layout: false,
        titulo: 'Iniciar Sesión',
        mensajeError: 'Por favor completa todos los campos'
      });
    }

    console.log(`→ Intentando iniciar sesión con: ${nombreUsuario}`);

    // Buscar usuario en MySQL
    const usuario =
      await userModel.obtenerPorNombreUsuario(nombreUsuario);

    // Usuario no encontrado
    if (!usuario) {
      console.warn(
        `⚠ Usuario no encontrado: ${nombreUsuario}`
      );

      return res.status(401).render('login', {
        layout: false,
        titulo: 'Iniciar Sesión',
        mensajeError:
          'Nombre de usuario o contraseña incorrectos'
      });
    }

    console.log('✓ Usuario encontrado en MySQL');

    /*
     * Las consultas usan alias en MAYÚSCULAS para mantener compatibilidad con las vistas existentes.
     */

    if (!usuario.PASSWORD_HASH) {
      console.error(
        '❌ El usuario no contiene PASSWORD_HASH'
      );

      console.log(
        'Columnas recibidas:',
        Object.keys(usuario)
      );

      return res.status(500).render('login', {
        layout: false,
        titulo: 'Iniciar Sesión',
        mensajeError:
          'Error en la configuración del usuario.'
      });
    }

    // Comparar contraseña ingresada con el hash guardado
    const passwordValida = await bcrypt.compare(
      password,
      usuario.PASSWORD_HASH
    );

    // Contraseña incorrecta
    if (!passwordValida) {
      console.warn(
        `⚠ Contraseña incorrecta para usuario: ${nombreUsuario}`
      );

      return res.status(401).render('login', {
        layout: false,
        titulo: 'Iniciar Sesión',
        mensajeError:
          'Nombre de usuario o contraseña incorrectos'
      });
    }

    // Crear sesión
    req.session.usuario = {
      id: usuario.ID_USUARIO,
      nombreUsuario: usuario.NOMBRE_USUARIO,
      email: usuario.EMAIL,
      nombreCompleto: usuario.NOMBRE_COMPLETO
    };

    console.log(
      `✓ Login exitoso para usuario: ${nombreUsuario}`
    );

    // Guardar sesión antes de redirigir
    req.session.save((error) => {
      if (error) {
        console.error(
          '❌ Error guardando sesión:',
          error
        );

        return res.status(500).render('login', {
          layout: false,
          titulo: 'Iniciar Sesión',
          mensajeError:
            'No se pudo iniciar la sesión.'
        });
      }

      return res.redirect('/home');
    });

  } catch (error) {
    console.error(
      '❌ Error en procesarLogin:',
      error
    );

    return res.status(500).render('login', {
      layout: false,
      titulo: 'Iniciar Sesión',
      mensajeError:
        'Error al conectar con el sistema. Intenta más tarde.'
    });
  }
}

/**
 * Cierra la sesión del usuario
 */
function logout(req, res) {
  try {
    const usuario =
      req.session?.usuario?.nombreUsuario;

    req.session.destroy((err) => {
      if (err) {
        console.error(
          '❌ Error destruyendo sesión:',
          err
        );

        return res
          .status(500)
          .send('Error al cerrar sesión');
      }

      console.log(
        `✓ Logout para usuario: ${usuario}`
      );

      return res.redirect(
        '/login?mensaje=Sesion cerrada correctamente'
      );
    });

  } catch (error) {
    console.error(
      '❌ Error en logout:',
      error
    );

    return res
      .status(500)
      .send('Error al cerrar sesión');
  }
}

module.exports = {
  mostrarLogin,
  procesarLogin,
  logout
};