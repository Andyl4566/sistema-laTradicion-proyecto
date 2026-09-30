-- =====================================================
-- SEGURIDAD DE LA BASE DE DATOS
-- Base de datos: bd_tradicion
-- Entrega 3
-- =====================================================

USE bd_tradicion;

-- Usuarios utilizados como roles funcionales
CREATE USER IF NOT EXISTS 'rol_administrador'@'%'
IDENTIFIED BY 'CAMBIAR_PASSWORD_ADMIN';

CREATE USER IF NOT EXISTS 'rol_ventas'@'%'
IDENTIFIED BY 'CAMBIAR_PASSWORD_VENTAS';

CREATE USER IF NOT EXISTS 'rol_produccion'@'%'
IDENTIFIED BY 'CAMBIAR_PASSWORD_PRODUCCION';

-- Administrador
GRANT ALL PRIVILEGES
ON bd_tradicion.*
TO 'rol_administrador'@'%';

-- Ventas
GRANT SELECT, INSERT, UPDATE
ON bd_tradicion.cliente
TO 'rol_ventas'@'%';

GRANT SELECT
ON bd_tradicion.producto
TO 'rol_ventas'@'%';

GRANT SELECT, INSERT, UPDATE
ON bd_tradicion.venta
TO 'rol_ventas'@'%';

GRANT SELECT, INSERT, UPDATE
ON bd_tradicion.producto_venta
TO 'rol_ventas'@'%';

-- Producción
GRANT SELECT
ON bd_tradicion.producto
TO 'rol_produccion'@'%';

GRANT SELECT, UPDATE
ON bd_tradicion.materia_prima
TO 'rol_produccion'@'%';

GRANT SELECT, INSERT, UPDATE
ON bd_tradicion.produccion
TO 'rol_produccion'@'%';

GRANT SELECT, INSERT, UPDATE
ON bd_tradicion.detalle_fabricacion
TO 'rol_produccion'@'%';

GRANT SELECT, INSERT, UPDATE
ON bd_tradicion.produccion_empleado
TO 'rol_produccion'@'%';

GRANT SELECT, INSERT, UPDATE
ON bd_tradicion.materia_prima_produccion
TO 'rol_produccion'@'%';
