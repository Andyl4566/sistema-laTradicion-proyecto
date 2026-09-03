-- ============================================================
-- Archivo: bd_tradicion_mysql.sql
-- Descripción: Conversión de SCRIPToracle.sql de Oracle a MySQL 8.x
-- Nomenclatura: snake_case en minúsculas
-- Notas: VARCHAR2->VARCHAR, NUMBER->INT/DECIMAL, SYSDATE->CURRENT_TIMESTAMP.
-- Las secuencias Oracle seq_cliente y seq_proveedor se convierten en AUTO_INCREMENT.
-- ============================================================

CREATE DATABASE IF NOT EXISTS bd_tradicion
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE bd_tradicion;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS venta_materia_prima;
DROP TABLE IF EXISTS producto_venta;
DROP TABLE IF EXISTS produccion_empleado;
DROP TABLE IF EXISTS materia_prima_producto;
DROP TABLE IF EXISTS materia_prima_produccion;
DROP TABLE IF EXISTS detalle_fabricacion;
DROP TABLE IF EXISTS detalle_compra_materia_prima;
DROP TABLE IF EXISTS detalle_compra;
DROP TABLE IF EXISTS venta;
DROP TABLE IF EXISTS compras;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS producto;
DROP TABLE IF EXISTS produccion;
DROP TABLE IF EXISTS materia_prima;
DROP TABLE IF EXISTS gastos_operativos;
DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS proveedor;
DROP TABLE IF EXISTS cliente;

SET FOREIGN_KEY_CHECKS = 1;

-- Tabla: cliente
CREATE TABLE cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(200) NOT NULL,
  telefono VARCHAR(50),
  correo VARCHAR(200),
  direccion VARCHAR(200),
  CONSTRAINT pk_cliente PRIMARY KEY (id_cliente),
  CONSTRAINT uq_cliente_correo UNIQUE (correo)
) ENGINE=InnoDB;

-- Tabla: proveedor
CREATE TABLE proveedor (
  id_proveedor INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(200) NOT NULL,
  telefono VARCHAR(50),
  correo VARCHAR(200),
  CONSTRAINT pk_proveedor PRIMARY KEY (id_proveedor)
) ENGINE=InnoDB;

-- Tabla: empleado
CREATE TABLE empleado (
  id_empleado INT NOT NULL,
  nombre VARCHAR(200) NOT NULL,
  dpi VARCHAR(100) NOT NULL,
  telefono VARCHAR(50),
  salario DECIMAL(10,2),
  fecha_contratacion DATE,
  estado VARCHAR(50),
  CONSTRAINT pk_empleado PRIMARY KEY (id_empleado),
  CONSTRAINT uq_empleado_dpi UNIQUE (dpi),
  CONSTRAINT chk_empleado_salario CHECK (salario >= 0)
) ENGINE=InnoDB;

-- Tabla: gastos_operativos
CREATE TABLE gastos_operativos (
  id_gastos_operativos INT NOT NULL,
  descripcion VARCHAR(200),
  motivo VARCHAR(200),
  fecha_gasto DATE NOT NULL,
  monto DECIMAL(10,2),
  estado VARCHAR(50),
  CONSTRAINT pk_gastos_operativos PRIMARY KEY (id_gastos_operativos),
  CONSTRAINT chk_gastos_operativos_monto CHECK (monto >= 0)
) ENGINE=InnoDB;

-- Tabla: materia_prima
CREATE TABLE materia_prima (
  id_materia_prima INT NOT NULL,
  nombre VARCHAR(200) NOT NULL,
  descripcion VARCHAR(200),
  cantidad INT DEFAULT 0,
  costo DECIMAL(10,2),
  CONSTRAINT pk_materia_prima PRIMARY KEY (id_materia_prima),
  CONSTRAINT chk_materia_prima_cantidad CHECK (cantidad >= 0),
  CONSTRAINT chk_materia_prima_costo CHECK (costo >= 0)
) ENGINE=InnoDB;

-- Tabla: produccion
CREATE TABLE produccion (
  id_produccion INT NOT NULL,
  nombre VARCHAR(200) NOT NULL,
  descripcion VARCHAR(200),
  fecha_produccion DATE NOT NULL,
  CONSTRAINT pk_produccion PRIMARY KEY (id_produccion)
) ENGINE=InnoDB;

-- Tabla: producto
CREATE TABLE producto (
  id_producto INT NOT NULL,
  nombre VARCHAR(200) NOT NULL,
  descripcion VARCHAR(200),
  unidades INT DEFAULT 0,
  precio_unitario DECIMAL(10,2),
  CONSTRAINT pk_producto PRIMARY KEY (id_producto),
  CONSTRAINT chk_producto_unidades CHECK (unidades >= 0),
  CONSTRAINT chk_producto_precio CHECK (precio_unitario >= 0)
) ENGINE=InnoDB;

-- Tabla: usuarios
CREATE TABLE usuarios (
  id_usuario INT NOT NULL,
  nombre_usuario VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  nombre_completo VARCHAR(100),
  activo TINYINT(1) NOT NULL DEFAULT 1,
  fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT pk_usuarios PRIMARY KEY (id_usuario),
  CONSTRAINT uq_usuarios_nombre_usuario UNIQUE (nombre_usuario),
  CONSTRAINT uq_usuarios_email UNIQUE (email)
) ENGINE=InnoDB;

-- Tabla: venta
CREATE TABLE venta (
  id_venta INT NOT NULL,
  asunto VARCHAR(200),
  fecha_venta DATE NOT NULL,
  monto DECIMAL(10,2),
  id_empleado INT NOT NULL,
  id_cliente INT NOT NULL,
  CONSTRAINT pk_venta PRIMARY KEY (id_venta),
  CONSTRAINT chk_venta_monto CHECK (monto >= 0)
) ENGINE=InnoDB;

-- Tabla: compras
CREATE TABLE compras (
  id_compras INT NOT NULL,
  fecha_compra DATE NOT NULL,
  monto DECIMAL(10,2),
  id_proveedor INT NOT NULL,
  CONSTRAINT pk_compras PRIMARY KEY (id_compras),
  CONSTRAINT chk_compras_monto CHECK (monto >= 0)
) ENGINE=InnoDB;

-- Tabla: detalle_compra
CREATE TABLE detalle_compra (
  id_proveedor INT NOT NULL,
  id_materia_prima INT NOT NULL,
  CONSTRAINT pk_detalle_compra PRIMARY KEY (id_proveedor, id_materia_prima)
) ENGINE=InnoDB;

-- Tabla: detalle_compra_materia_prima
CREATE TABLE detalle_compra_materia_prima (
  id_compras INT NOT NULL,
  id_materia_prima INT NOT NULL,
  CONSTRAINT pk_det_compra_matprima PRIMARY KEY (id_compras, id_materia_prima)
) ENGINE=InnoDB;

-- Tabla: detalle_fabricacion
CREATE TABLE detalle_fabricacion (
  id_produccion INT NOT NULL,
  id_producto INT NOT NULL,
  CONSTRAINT pk_detalle_fabricacion PRIMARY KEY (id_produccion, id_producto)
) ENGINE=InnoDB;

-- Tabla: materia_prima_produccion
CREATE TABLE materia_prima_produccion (
  id_materia_prima INT NOT NULL,
  id_produccion INT NOT NULL,
  CONSTRAINT pk_materia_prima_produccion PRIMARY KEY (id_materia_prima, id_produccion)
) ENGINE=InnoDB;

-- Tabla: materia_prima_producto
CREATE TABLE materia_prima_producto (
  id_materia_prima INT NOT NULL,
  id_producto INT NOT NULL,
  cantidad DECIMAL(10,2),
  CONSTRAINT pk_materia_prima_producto PRIMARY KEY (id_materia_prima, id_producto),
  CONSTRAINT chk_materia_prima_producto_cantidad CHECK (cantidad > 0)
) ENGINE=InnoDB;

-- Tabla: produccion_empleado
CREATE TABLE produccion_empleado (
  id_produccion INT NOT NULL,
  id_empleado INT NOT NULL,
  CONSTRAINT pk_produccion_empleado PRIMARY KEY (id_produccion, id_empleado)
) ENGINE=InnoDB;

-- Tabla: producto_venta
CREATE TABLE producto_venta (
  id_venta INT NOT NULL,
  id_producto INT NOT NULL,
  CONSTRAINT pk_producto_venta PRIMARY KEY (id_venta, id_producto)
) ENGINE=InnoDB;

-- Tabla: venta_materia_prima
CREATE TABLE venta_materia_prima (
  id_venta INT NOT NULL,
  id_materia_prima INT NOT NULL,
  CONSTRAINT pk_venta_materia_prima PRIMARY KEY (id_venta, id_materia_prima)
) ENGINE=InnoDB;

-- Claves foráneas (ON UPDATE explícito para cumplir el estándar del proyecto)
ALTER TABLE compras
  ADD CONSTRAINT fk_compras_proveedor
  FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE detalle_compra
  ADD CONSTRAINT fk_detcompra_proveedor
  FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE detalle_compra
  ADD CONSTRAINT fk_detcompra_materiaprima
  FOREIGN KEY (id_materia_prima) REFERENCES materia_prima (id_materia_prima)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE detalle_compra_materia_prima
  ADD CONSTRAINT fk_detcompmat_compras
  FOREIGN KEY (id_compras) REFERENCES compras (id_compras)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE detalle_compra_materia_prima
  ADD CONSTRAINT fk_detcompmat_materiaprima
  FOREIGN KEY (id_materia_prima) REFERENCES materia_prima (id_materia_prima)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE detalle_fabricacion
  ADD CONSTRAINT fk_detfab_produccion
  FOREIGN KEY (id_produccion) REFERENCES produccion (id_produccion)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE detalle_fabricacion
  ADD CONSTRAINT fk_detfab_producto
  FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE materia_prima_produccion
  ADD CONSTRAINT fk_matprod_materiaprima
  FOREIGN KEY (id_materia_prima) REFERENCES materia_prima (id_materia_prima)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE materia_prima_produccion
  ADD CONSTRAINT fk_matprod_produccion
  FOREIGN KEY (id_produccion) REFERENCES produccion (id_produccion)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE materia_prima_producto
  ADD CONSTRAINT fk_matprodc_materiaprima
  FOREIGN KEY (id_materia_prima) REFERENCES materia_prima (id_materia_prima)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE materia_prima_producto
  ADD CONSTRAINT fk_matprodc_producto
  FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE produccion_empleado
  ADD CONSTRAINT fk_prodemp_produccion
  FOREIGN KEY (id_produccion) REFERENCES produccion (id_produccion)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE produccion_empleado
  ADD CONSTRAINT fk_prodemp_empleado
  FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE producto_venta
  ADD CONSTRAINT fk_prodventa_venta
  FOREIGN KEY (id_venta) REFERENCES venta (id_venta)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE producto_venta
  ADD CONSTRAINT fk_prodventa_producto
  FOREIGN KEY (id_producto) REFERENCES producto (id_producto)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE venta
  ADD CONSTRAINT fk_venta_empleado
  FOREIGN KEY (id_empleado) REFERENCES empleado (id_empleado)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE venta
  ADD CONSTRAINT fk_venta_cliente
  FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
  ON DELETE RESTRICT
  ON UPDATE RESTRICT;

ALTER TABLE venta_materia_prima
  ADD CONSTRAINT fk_ventamat_venta
  FOREIGN KEY (id_venta) REFERENCES venta (id_venta)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

ALTER TABLE venta_materia_prima
  ADD CONSTRAINT fk_ventamat_materiaprima
  FOREIGN KEY (id_materia_prima) REFERENCES materia_prima (id_materia_prima)
  ON DELETE CASCADE
  ON UPDATE RESTRICT;

-- Datos exportados desde Oracle
INSERT INTO cliente (id_cliente, nombre, telefono, correo, direccion) VALUES
  (1, 'David', '1222 4432', 'aridavid@gmail.com', '35AvC 10A-61 zona 8'),
  (2, 'Carlos', '3245 7809', 'carlos00@gmail.com', 'CalleHuerta Marcos 19 Puerta 828'),
  (3, 'andy', '1116 6666', 'andy@gmail.com', 'CalleHuerta Marcos 19 Puerta 828');

INSERT INTO proveedor (id_proveedor, nombre, telefono, correo)
VALUES (1, 'MASECA', '22220011', 'maseca@gmail.com');

INSERT INTO usuarios (id_usuario, nombre_usuario, email, password_hash, nombre_completo, activo, fecha_creacion)
VALUES (1, 'admin', 'admin@empresa.com', '$2a$10$J3QStAoQwIR9mfQyyYvhNO3yQVAA/DrNYpzU48StPQR/KPG21JLb2', 'Administrador', 1, '2026-09-01 00:00:00');

-- Conserva los siguientes valores de las secuencias Oracle exportadas.
ALTER TABLE cliente AUTO_INCREMENT = 4;
ALTER TABLE proveedor AUTO_INCREMENT = 2;
