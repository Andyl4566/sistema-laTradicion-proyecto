# Sistema-laTradicion-proyecto
Proyecto de base de datos y aplicación web

Proyecto académico de base de datos y aplicación web para una empresa dedicada a la elaboración y comercialización de tortillas, nachos y otros productos derivados de harina.

**Estado:** aplicación probada localmente; también se reportaron pruebas de operación remota privada con un servidor Debian y MariaDB. La instalación desde cero y la publicación abierta en internet siguen pendientes de certificación.

## Funcionalidades

El sistema dispone de nueve módulos administrativos:

| Módulo | Funciones principales |
| --- | --- |
| Productos | Crear, consultar, editar y eliminar productos |
| Materia prima | Administrar insumos y existencias |
| Proveedores | Registrar y mantener proveedores |
| Clientes | Registrar y mantener clientes |
| Empleados | Administrar y desactivar empleados |
| Gastos operativos | Registrar y administrar gastos |
| Compras | Registrar, consultar detalles y anular compras |
| Ventas | Registrar, consultar y anular ventas |
| Producción | Registrar, consultar detalles y anular producciones |

La aplicación incluye autenticación y perfiles **Administrador**, **Producción** y **Ventas**, con acceso diferenciado a los módulos. Los perfiles de la aplicación son distintos de los roles definidos en MySQL.

## Tecnologías

- Node.js 18 o superior y Express 4
- EJS y express-ejs-layouts
- MySQL 8 en el entorno original; MariaDB 11.8.6 en el servidor Debian, y `mysql2`
- JavaScript, HTML y CSS
- `express-session`, `bcryptjs` y `dotenv`

El código se organiza en rutas, controladores, modelos, vistas y configuración.

## Requisitos previos

1. Node.js 18 o superior y npm.
2. MySQL Server 8.x o una instalación MariaDB compatible, según el entorno que se vaya a reproducir.
3. Base de datos `bd_tradicion` restaurada con un script compatible y, cuando corresponda, datos iniciales y cuentas de usuario.
4. Una cuenta MySQL con permisos apropiados para la aplicación.

MySQL Workbench es opcional para administrar y consultar la base de datos.

## Inicio local

Desde la carpeta raíz del proyecto (donde está `package.json`):

```bash
npm install
```

Copia `.env.example` a `.env` y configura valores **propios**. No reutilices las contraseñas de ejemplo que aparezcan en versiones anteriores del proyecto.

```env
PORT=3000
NODE_ENV=development
DB_HOST=localhost
DB_PORT=3306
DB_NAME=bd_tradicion
DB_USER=usuario_mysql
DB_PASSWORD=coloca_tu_contrasena_segura
SESSION_SECRET=genera_un_secreto_largo_y_aleatorio
```

Inicia el servidor:

```bash
npm start
```

Accede a `http://localhost:3000/login`.

La ruta `http://localhost:3000/health` permite comprobar que el servidor responde. **No sustituye** las pruebas funcionales ni una verificación completa de la base de datos.

> El archivo `.env` contiene secretos: no debe compartirse ni incorporarse al repositorio. Antes de publicar, elimina las credenciales de prueba visibles en la pantalla de inicio de sesión y configura credenciales seguras.

## Estructura del proyecto

```text
.
├── README.md
├── INSTALL.md                  # Guía de instalación preparada; validación limpia pendiente
├── .env.example
├── package.json
├── docs/                       # Entregas, diagramas, manuales y evidencias
├── sql/                        # Scripts de base de datos
└── web/
    ├── app.js                  # Entrada del servidor
    ├── config/                 # Configuración y conexión MySQL
    ├── routes/                 # Rutas HTTP
    ├── controllers/            # Lógica de las solicitudes
    ├── models/                 # Acceso a datos
    ├── views/                  # Plantillas EJS
    └── public/                 # Recursos estáticos
```

La estructura representa la organización esperada para la entrega; algunos documentos deben incorporarse todavía al repositorio definitivo.

## Documentación y pruebas

- `docs/entrega-4/MANUAL_TECNICO.md`: arquitectura, base de datos y seguridad (documento preparado; pendiente de integración).
- `docs/entrega-4/INFORME_FINAL.md`: desarrollo, resultados y conclusiones (documento preparado; pendiente de integración).
- `docs/entrega-4/evidencias/`: capturas y comprobaciones (estructura propuesta; pendiente de consolidación).
- `INSTALL.md`: guía de instalación ya redactada; la prueba completa desde cero está pendiente.

Las pruebas de módulos y control de acceso se realizaron localmente. También se reportaron pruebas de acceso remoto privado y verificación de una venta en la base de datos centralizada. Quedan pendientes la instalación limpia, la publicación pública segura (si se exige) y la revisión de los requisitos de datos mínimos.

## Precauciones para despliegue

El código original revisado escuchaba en `127.0.0.1`; el servidor Debian ya permitió operación remota privada. Para publicación abierta en internet se requiere una revisión independiente de red y seguridad. También se debe revisar la configuración de sesiones y cookies para HTTPS y no publicar credenciales de prueba.

## Integridad académica

Las contribuciones del equipo y el uso de herramientas de inteligencia artificial deben quedar documentados en las bitácoras y certificaciones correspondientes. El informe final debe distinguir entre requisitos comprobados y pendientes.


# Integrantes
-Ian Paolo Navarijo Morfin 
carnet: 2690-24-8137

-Ari Ben David García Claros 
carnet: 2690-24-25277

-Andy Mynor Pérez López 
carnet: 2690-24-23562

-Angelo Gabriel Machá Mota 
carnet: 2690-24-22602


# SGBD
MySQL Data Base
# Herramienta CASE
MySQL Workbench
