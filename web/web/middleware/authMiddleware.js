/**
 * Middleware de autenticación y autorización.
 *
 * Comprueba que el usuario haya iniciado sesión y permite
 * restringir rutas según el rol almacenado en la sesión.
 */

/**
 * Verifica que exista una sesión iniciada.
 */
function requiereAutenticacion(req, res, next) {
  if (!req.session || !req.session.usuario) {
    return res.redirect('/login');
  }

  next();
}

/**
 * Permite el acceso únicamente a los roles indicados.
 *
 * Ejemplo:
 * permitirRoles('administrador', 'ventas')
 */
function permitirRoles(...rolesPermitidos) {
  return (req, res, next) => {

    if (!req.session || !req.session.usuario) {
      return res.redirect('/login');
    }

    const rolUsuario = req.session.usuario.rol;

    if (!rolesPermitidos.includes(rolUsuario)) {
      console.warn(
        `⚠ Acceso denegado: ${req.session.usuario.nombreUsuario} ` +
        `(${rolUsuario}) intentó acceder a ${req.originalUrl}`
      );

      return res.status(403).send(`
        <h1>Acceso denegado</h1>
        <p>No tienes permisos para acceder a este módulo.</p>
        <a href="/home">Volver al Dashboard</a>
      `);
    }

    next();
  };
}

module.exports = {
  requiereAutenticacion,
  permitirRoles
};