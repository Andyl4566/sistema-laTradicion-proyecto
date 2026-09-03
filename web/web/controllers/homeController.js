/**
 * Controlador: Home/Dashboard (homeController)
 *
 * Gestiona la página de inicio después del login.
 * Requiere autenticación (sesión activa).
 */

/**
 * Muestra la página de inicio (Dashboard)
 */
function mostrarHome(req, res) {
  try {

    // Verificar que el usuario esté autenticado
    if (!req.session || !req.session.usuario) {
      return res.redirect('/login');
    }

    const usuario = req.session.usuario;

    return res.render('home', {

      titulo:
        'Dashboard - Empresa de Tortillas, Nachos y Harina',

      usuario: usuario,

      fechaActual:
        new Date().toLocaleDateString(
          'es-GT',
          {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
          }
        ),

      modulos: [

        {
          id: 'productos',
          nombre: 'Productos',
          descripcion:
            'Administrar los productos terminados de la empresa.',
          icono: '🌮',
          ruta: '/productos',
          estado: 'en-desarrollo'
        },

        {
          id: 'materia-prima',
          nombre: 'Materia Prima',
          descripcion:
            'Administrar los insumos utilizados para elaborar los productos.',
          icono: '🌽',
          ruta: '/materia-prima',
          estado: 'en-desarrollo'
        },

        {
          id: 'proveedores',
          nombre: 'Proveedores',
          descripcion:
            'Registrar y administrar los proveedores de materia prima.',
          icono: '🚚',
          ruta: '/proveedores',
          estado: 'activo'
        },

        {
          id: 'compras',
          nombre: 'Compras',
          descripcion:
            'Registrar las compras realizadas a los proveedores.',
          icono: '🛒',
          ruta: '/compras',
          estado: 'en-desarrollo'
        },

        {
          id: 'ventas',
          nombre: 'Ventas',
          descripcion:
            'Registrar y consultar las ventas realizadas.',
          icono: '💰',
          ruta: '/ventas',
          estado: 'en-desarrollo'
        },

        {
          id: 'clientes',
          nombre: 'Clientes',
          descripcion:
            'Administrar la información de los clientes.',
          icono: '👥',
          ruta: '/clientes',
          estado: 'activo'
        },

        {
          id: 'empleados',
          nombre: 'Empleados',
          descripcion:
            'Administrar los empleados de la empresa.',
          icono: '👨‍💼',
          ruta: '/empleados',
          estado: 'en-desarrollo'
        },

        {
          id: 'produccion',
          nombre: 'Producción',
          descripcion:
            'Registrar y controlar los procesos de producción.',
          icono: '🏭',
          ruta: '/produccion',
          estado: 'en-desarrollo'
        },

        {
          id: 'gastos-operativos',
          nombre: 'Gastos Operativos',
          descripcion:
            'Registrar gastos como limpieza, fumigación y otros servicios.',
          icono: '🧾',
          ruta: '/gastos-operativos',
          estado: 'en-desarrollo'
        },

        {
          id: 'usuarios',
          nombre: 'Usuarios',
          descripcion:
            'Administrar los usuarios con acceso al sistema.',
          icono: '🔐',
          ruta: '/usuarios',
          estado: 'en-desarrollo'
        }

      ]

    });

  } catch (error) {

    console.error(
      '❌ Error en mostrarHome:',
      error
    );

    return res.status(500).render(
      'error',
      {
        titulo: 'Error',
        mensajeError:
          'Error al cargar el dashboard'
      }
    );

  }
}

module.exports = {
  mostrarHome
};