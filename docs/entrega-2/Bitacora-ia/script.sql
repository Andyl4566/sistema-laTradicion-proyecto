/*
=============================================================================
ARCHIVO:      sql/ddl/01_create_tables.sql
AUTOR:        Desarrollador 2 (Ingeniero de Base de Datos)
PROYECTO:     Sistema de Base de Datos - La Tradición
DESCRIPCIÓN:  Creación de tablas del sistema y restricciones de integridad.
DEPENDENCIAS: Ninguna (Script inicial DDL).
=============================================================================
*/

-- -----------------------------------------------------------------------------
-- 1. TABLAS INDEPENDIENTES (ENTIDADES BASE)
-- -----------------------------------------------------------------------------

CREATE TABLE cliente (
    id_cliente      INT NOT NULL,
    nombre          VARCHAR(200) NOT NULL,
    telefono        VARCHAR(50),
    correo          VARCHAR(200) UNIQUE,
    direccion       VARCHAR(200),
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);

CREATE TABLE empleado (
    id_empleado        INT NOT NULL,
    nombre             VARCHAR(200) NOT NULL,
    dpi                VARCHAR(100) NOT NULL UNIQUE,
    telefono           VARCHAR(50),
    salario            DECIMAL(10,2) CHECK (salario >= 0),
    fecha_contratacion DATE,
    estado             VARCHAR(50),
    CONSTRAINT pk_empleado PRIMARY KEY (id_empleado)
);

CREATE TABLE proveedor (
    id_proveedor   INT NOT NULL,
    nombre         VARCHAR(200) NOT NULL,
    telefono       VARCHAR(50),
    correo         VARCHAR(200),
    CONSTRAINT pk_proveedor PRIMARY KEY (id_proveedor)
);

CREATE TABLE materia_prima (
    id_materia_prima INTEGER NOT NULL,
    nombre           VARCHAR(200) NOT NULL,
    descripcion      VARCHAR(200),
    cantidad         INTEGER DEFAULT 0 CHECK (cantidad >= 0),
    costo            DECIMAL(10,2) CHECK (costo >= 0),
    CONSTRAINT pk_materia_prima PRIMARY KEY (id_materia_prima)
);

CREATE TABLE producto (
    id_producto     INTEGER NOT NULL,
    nombre          VARCHAR(200) NOT NULL,
    descripcion     VARCHAR(200),
    unidades        INTEGER DEFAULT 0 CHECK (unidades >= 0),
    precio_unitario DECIMAL(10,2) CHECK (precio_unitario >= 0),
    CONSTRAINT pk_producto PRIMARY KEY (id_producto)
);

CREATE TABLE gastos_operativos (
    id_gastos_operativos INTEGER NOT NULL,
    descripcion          VARCHAR(200),
    motivo               VARCHAR(200),
    fecha_gasto          DATE NOT NULL,
    monto                DECIMAL(10,2) CHECK (monto >= 0),
    estado               VARCHAR(50),
    CONSTRAINT pk_gastos_operativos PRIMARY KEY (id_gastos_operativos)
);

-- -----------------------------------------------------------------------------
-- 2. TABLAS TRANSACCIONALES
-- -----------------------------------------------------------------------------

CREATE TABLE compras (
    id_compras   INTEGER NOT NULL,
    fecha_compra DATE NOT NULL,
    monto        DECIMAL(10,2) CHECK (monto >= 0),
    id_proveedor INTEGER NOT NULL,
    CONSTRAINT pk_compras PRIMARY KEY (id_compras),
    CONSTRAINT fk_compras_proveedor FOREIGN KEY (id_proveedor) 
        REFERENCES proveedor(id_proveedor)
);

CREATE TABLE produccion (
    id_produccion    INTEGER NOT NULL,
    nombre           VARCHAR(200) NOT NULL,
    descripcion      VARCHAR(200),
    fecha_produccion DATE NOT NULL,
    CONSTRAINT pk_produccion PRIMARY KEY (id_produccion)
);

CREATE TABLE venta (
    id_venta    INTEGER NOT NULL,
    asunto      VARCHAR(200),
    fecha_venta DATE NOT NULL,
    monto       DECIMAL(10,2) CHECK (monto >= 0),
    id_empleado INTEGER NOT NULL,
    id_cliente  INTEGER NOT NULL,
    CONSTRAINT pk_venta PRIMARY KEY (id_venta),
    CONSTRAINT fk_venta_empleado FOREIGN KEY (id_empleado) 
        REFERENCES empleado(id_empleado),
    CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente) 
        REFERENCES cliente(id_cliente)
);

-- -----------------------------------------------------------------------------
-- 3. TABLAS INTERMEDIAS (RELACIONES N:M)
-- -----------------------------------------------------------------------------

CREATE TABLE detalle_compra (
    id_proveedor     INTEGER NOT NULL,
    id_materia_prima INTEGER NOT NULL,
    CONSTRAINT pk_detalle_compra PRIMARY KEY (id_proveedor, id_materia_prima),
    CONSTRAINT fk_detcompra_proveedor FOREIGN KEY (id_proveedor) 
        REFERENCES proveedor(id_proveedor) ON DELETE CASCADE,
    CONSTRAINT fk_detcompra_materiaprima FOREIGN KEY (id_materia_prima) 
        REFERENCES materia_prima(id_materia_prima) ON DELETE CASCADE
);

CREATE TABLE detalle_compra_materia_prima (
    id_compras       INTEGER NOT NULL,
    id_materia_prima INTEGER NOT NULL,
    CONSTRAINT pk_det_compra_matprima PRIMARY KEY (id_compras, id_materia_prima),
    CONSTRAINT fk_detcompmat_compras FOREIGN KEY (id_compras) 
        REFERENCES compras(id_compras) ON DELETE CASCADE,
    CONSTRAINT fk_detcompmat_materiaprima FOREIGN KEY (id_materia_prima) 
        REFERENCES materia_prima(id_materia_prima) ON DELETE CASCADE
);

CREATE TABLE detalle_fabricacion (
    id_produccion INTEGER NOT NULL,
    id_producto   INTEGER NOT NULL,
    CONSTRAINT pk_detalle_fabricacion PRIMARY KEY (id_produccion, id_producto),
    CONSTRAINT fk_detfab_produccion FOREIGN KEY (id_produccion) 
        REFERENCES produccion(id_produccion) ON DELETE CASCADE,
    CONSTRAINT fk_detfab_producto FOREIGN KEY (id_producto) 
        REFERENCES producto(id_producto) ON DELETE CASCADE
);

CREATE TABLE materia_prima_produccion (
    id_materia_prima INTEGER NOT NULL,
    id_produccion    INTEGER NOT NULL,
    CONSTRAINT pk_materia_prima_produccion PRIMARY KEY (id_materia_prima, id_produccion),
    CONSTRAINT fk_matprod_materiaprima FOREIGN KEY (id_materia_prima) 
        REFERENCES materia_prima(id_materia_prima) ON DELETE CASCADE,
    CONSTRAINT fk_matprod_produccion FOREIGN KEY (id_produccion) 
        REFERENCES produccion(id_produccion) ON DELETE CASCADE
);

CREATE TABLE materia_prima_producto (
    id_materia_prima INTEGER NOT NULL,
    id_producto      INTEGER NOT NULL,
    cantidad         DECIMAL(10,2) CHECK (cantidad > 0),
    CONSTRAINT pk_materia_prima_producto PRIMARY KEY (id_materia_prima, id_producto),
    CONSTRAINT fk_matprodc_materiaprima FOREIGN KEY (id_materia_prima) 
        REFERENCES materia_prima(id_materia_prima) ON DELETE CASCADE,
    CONSTRAINT fk_matprodc_producto FOREIGN KEY (id_producto) 
        REFERENCES producto(id_producto) ON DELETE CASCADE
);

CREATE TABLE produccion_empleado (
    id_produccion INTEGER NOT NULL,
    id_empleado   INTEGER NOT NULL,
    CONSTRAINT pk_produccion_empleado PRIMARY KEY (id_produccion, id_empleado),
    CONSTRAINT fk_proddemp_produccion FOREIGN KEY (id_produccion) 
        REFERENCES produccion(id_produccion) ON DELETE CASCADE,
    CONSTRAINT fk_proddemp_empleado FOREIGN KEY (id_empleado) 
        REFERENCES empleado(id_empleado) ON DELETE CASCADE
);

CREATE TABLE producto_venta (
    id_venta    INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,
    CONSTRAINT pk_producto_venta PRIMARY KEY (id_venta, id_producto),
    CONSTRAINT fk_prodventa_venta FOREIGN KEY (id_venta) 
        REFERENCES venta(id_venta) ON DELETE CASCADE,
    CONSTRAINT fk_prodventa_producto FOREIGN KEY (id_producto) 
        REFERENCES producto(id_producto) ON DELETE CASCADE
);

CREATE TABLE venta_materia_prima (
    id_venta         INTEGER NOT NULL,
    id_materia_prima INTEGER NOT NULL,
    CONSTRAINT pk_venta_materia_prima PRIMARY KEY (id_venta, id_materia_prima),
    CONSTRAINT fk_ventamat_venta FOREIGN KEY (id_venta) 
        REFERENCES venta(id_venta) ON DELETE CASCADE,
    CONSTRAINT fk_ventamat_materiaprima FOREIGN KEY (id_materia_prima) 
        REFERENCES materia_prima(id_materia_prima) ON DELETE CASCADE
);