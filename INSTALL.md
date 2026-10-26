# INSTALL.md — Guía de instalación de La Tradición

**Proyecto:** Sistema de gestión de productos, materia prima, compras, ventas y producción.  
**Entrega:** 4 · **Estado de esta guía:** instrucciones preparadas; la instalación desde cero debe ser ejecutada y certificada por el equipo.

## 1. Requisitos previos

- Windows, Linux o macOS con acceso a una terminal.
- **Node.js 18 o superior** y npm.
- **MySQL 8** para reproducir el entorno original, o **MariaDB 11.8** para el servidor Debian ya utilizado; comprobar compatibilidad del script. MySQL Workbench es opcional para importación y verificación.
- El código fuente completo del proyecto y un **script SQL de instalación validado**, junto con los datos de prueba o mecanismos de creación de usuarios que correspondan.

Comprueba las herramientas:

```bash
node --version
npm --version
mysql --version
```

> Si `mysql` no se reconoce en la terminal de Windows, se puede importar el script desde MySQL Workbench. No es obligatorio que el cliente de consola esté en el `PATH`.

## 2. Ubicar la carpeta del proyecto

Extrae el ZIP y abre una terminal **en la carpeta que contiene `package.json`**. En el paquete revisado, esta carpeta se denomina `base_prueba` y se encuentra dentro de `base_prueba_MYSQL/`.

```text
base_prueba/
├── package.json
├── .env.example
├── web/
│   ├── app.js
│   └── config/
├── sql/
├── docs/
├── README.md
└── INSTALL.md
```

No es necesario trasladar manualmente `node_modules` de otra computadora.

## 3. Instalar las dependencias

Desde la carpeta de `package.json`, ejecuta:

```bash
npm install
```

Si existe un `package-lock.json` válido y compatible, puede utilizarse `npm ci` para una instalación reproducible. El proyecto utiliza Express, EJS, mysql2, dotenv y express-session, entre otras dependencias.

## 4. Preparar MySQL e importar el esquema

1. Inicia el servicio MySQL y verifica que puedas conectarte.
2. Localiza el script de estructura del proyecto: `sql/ddl/bd_tradicion_mysql.sql`. Existe además una exportación SQL revisada durante la Entrega 4 (`Dump20261019.sql`); **elige un único origen validado por el equipo**, sin ejecutar ambos indiscriminadamente sobre la misma base.
3. Inspecciona el script antes de importarlo: comprueba si crea el esquema `bd_tradicion`, si incluye `USE bd_tradicion`, si contiene objetos con `DEFINER`, y si incorpora o no datos.
4. En MySQL Workbench, conéctate al servidor, abre el archivo mediante **File > Open SQL Script** y ejecútalo. Si el script no crea el esquema, créalo previamente:

```sql
CREATE DATABASE IF NOT EXISTS bd_tradicion
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
```

5. Si el script no selecciona la base de datos, ejecuta `USE bd_tradicion;` antes de las sentencias correspondientes. **No ejecutes scripts destructivos sobre una base con información que necesites conservar.**
6. Si el script importado contiene solo estructura, importa después los datos de prueba **desde un archivo de datos aprobado por el equipo**. No se debe afirmar que el sistema cuenta con registros o usuarios funcionales hasta verificarlos.

Para comprobar la importación:

```sql
USE bd_tradicion;
SHOW TABLES;
SHOW PROCEDURE STATUS WHERE Db = 'bd_tradicion';
SHOW TRIGGERS FROM bd_tradicion;
```

> **Advertencia:** algunas exportaciones de Workbench pueden contener opciones GTID, `DEFINER` o instrucciones que requieren privilegios elevados. Si aparece un error de importación, registra el mensaje y ajusta una copia del script de forma controlada; no elimines restricciones ni objetos sin autorización del equipo.

## 5. Configurar variables de entorno

En la misma carpeta de `package.json`, crea `.env` a partir de `.env.example`:

**Windows (PowerShell):**

```powershell
Copy-Item .env.example .env
```

**Linux/macOS:**

```bash
cp .env.example .env
```

Edita `.env` con los valores reales de tu instalación:

```dotenv
PORT=3000
NODE_ENV=development
DB_HOST=localhost
DB_PORT=3306
DB_NAME=bd_tradicion
DB_USER=usuario_mysql_autorizado
DB_PASSWORD=COLOCAR_CONTRASENA_LOCAL
SESSION_SECRET=GENERAR_UN_SECRETO_LARGO_Y_ALEATORIO
```

- Sustituye todos los valores ilustrativos por los correspondientes a tu equipo.
- La cuenta MySQL debe tener los permisos necesarios para las operaciones de la aplicación; **no uses `root` para el despliegue público**.
- No publiques `.env` ni contraseñas en Git, capturas o documentos.
- El `.env.example` del paquete original incluye valores de ejemplo poco seguros: **no los reutilices como credenciales reales**. Su actualización debe coordinarse con el equipo.

## 6. Ejecutar la aplicación

Desde la raíz del proyecto:

```bash
npm start
```

Para desarrollo local, también existe:

```bash
npm run dev
```

Con `PORT=3000`, abre:

- Aplicación: `http://localhost:3000/`
- Inicio de sesión: `http://localhost:3000/login`
- Comprobación del servidor: `http://localhost:3000/health`

El endpoint `/health` confirma que el servidor HTTP responde; **no es por sí solo una prueba de todas las funciones de la base de datos**. En el código revisado, el inicio del servidor intenta conectar con MySQL antes de escuchar peticiones.

Para detener el servidor en la terminal: `Ctrl + C`.

## 7. Verificar la instalación

Realiza las siguientes comprobaciones y conserva evidencia de cada una:

| Prueba | Resultado esperado | Evidencia |
|---|---|---|
| `npm install` | Dependencias instaladas sin errores bloqueantes | Salida de terminal |
| Importación SQL | Tablas y objetos requeridos visibles | Workbench / consultas SQL |
| `npm start` | Conexión MySQL y servidor iniciados | Salida de terminal |
| `/health` | Respuesta JSON con `status: OK` | Navegador |
| Inicio de sesión | Acceso con una cuenta de prueba autorizada | Captura, sin mostrar contraseña |
| Módulos | Menús y registros visibles según perfil | Capturas |
| Operaciones | Registrar, consultar, editar o anular según módulo | Capturas y consultas |
| Permisos | Acceso restringido a rutas no autorizadas | Registro de prueba |

**Importante:** el script de estructura por sí solo puede no crear cuentas web utilizables. El equipo debe aportar un procedimiento seguro para crear o restaurar usuarios de prueba, sin incluir contraseñas reales en el repositorio.

## 8. Problemas frecuentes

| Problema | Revisión recomendada |
|---|---|
| `node` o `npm` no se reconoce | Instalar Node.js y abrir una terminal nueva. |
| `Cannot find module` | Ejecutar `npm install` en la carpeta correcta. |
| `ECONNREFUSED` a MySQL | Verificar que el servicio esté activo, host y puerto. |
| `ER_ACCESS_DENIED_ERROR` | Revisar usuario, contraseña y privilegios MySQL. |
| `ER_BAD_DB_ERROR` | Confirmar que existe `bd_tradicion` y que `DB_NAME` coincide. |
| Falta una tabla o procedimiento | Revisar que el script completo se haya importado sin errores. |
| Puerto 3000 ocupado | Cambiar `PORT` en `.env` por otro puerto libre. |
| No se puede iniciar sesión | Confirmar que existen cuentas web válidas y que el equipo proporcionó el método de creación. |

## 9. Alcance local y despliegue en internet

Esta guía describe principalmente la **instalación local**. El código original revisado escuchaba en `127.0.0.1`; posteriormente se instaló la aplicación en un servidor Debian y se verificó acceso remoto privado a MariaDB mediante Tailscale y SSH. Esa prueba no acredita por sí misma una instalación limpia ni una publicación abierta en internet. Antes de cualquier publicación pública, el equipo debe revisar la configuración de escucha, el alojamiento, las variables de entorno, la base de datos, las sesiones, HTTPS y la protección de credenciales.

También debe retirarse cualquier credencial de demostración que aparezca en la pantalla de inicio de sesión antes del despliegue público.

## 10. Registro de validación final

- **Responsable de la instalación:** __________________
- **Fecha y equipo de prueba:** __________________
- **Versión de Node.js:** __________________
- **Versión de MySQL:** __________________
- **Script SQL utilizado:** __________________
- **Resultado de la importación:** __________________
- **Resultado del inicio de sesión y pruebas funcionales:** __________________
- **Ubicación de las evidencias:** `docs/entrega-4/evidencias/instalacion/`
- **Incidencias y soluciones:** __________________


