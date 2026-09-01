# Manual de Instalación

# Guía de Instalación y Despliegue de Base de Datos - Entrega 2
Este documento detalla el procedimiento paso a paso para la creación e instalación de la base de datos relacional del proyecto en **Oracle Database** utilizando **Oracle SQL Developer**.
---
## 1. Requisitos Previos
Antes de ejecutar los scripts de instalación, asegúrese de contar con las siguientes herramientas configuradas:
* **SGBD:** Oracle Database (19c, 21c o Express Edition XE).
* **Cliente GUI:** Oracle SQL Developer v20.0 o superior.
* **Usuario de BD:** Cuenta con privilegios para crear tablas, secuencias y restricciones (`CREATE TABLE`, `CREATE SEQUENCE`, `CREATE SESSION`).
* **Repositorio clonado:** Acceso a los archivos ubicados en la carpeta `/sql/ddl/`.
---

## 2. Orden Correcto de Ejecución de Scripts
Para evitar errores de integridad referencial al momento de crear claves foráneas (FK), los scripts ubicados dentro de la carpeta `/sql/ddl/` deben ejecutarse en un orden estricto de dependencias.
1. **`01_create_tables_independientes.sql`**: Tablas maestras o catálogos sin claves foráneas (ej. `rol`, `categoria`, `estado`).
2. **`02_create_tables_dependientes.sql`**: Tablas principales con relaciones a tablas maestras (ej. `usuario`, `producto`).
3. **`03_create_tables_transaccionales.sql`**: Tablas con dependencias múltiples y relaciones N:M (ej. `detalle_venta`, `asignacion`).
4. **`04_create_constraints.sql`**: Restricciones adicionales (`UNIQUE`, `CHECK`, alteración de `FOREIGN KEY` si se definen por separado).

> **Nota:** Si tu equipo consolidó la creación de la estructura en un único archivo, ejecuta `01_create_tables.sql`.
---
## 3. Instrucciones de Despliegue en Oracle SQL Developer
Siga estas instrucciones para ejecutar los scripts DDL desde la interfaz gráfica:
### Paso 1: Conexión a la Base de Datos
1. Abra **Oracle SQL Developer**.
2. En el panel izquierdo (**Conexiones**), haga clic en el icono de suma (**+**) para crear una nueva conexión.
3. Ingrese los datos del servidor 
Name: BDTradicion
Usuario: usuario0 
Contrasena: abc123 
Hostname: localhost
Port: 1521
SID/Service Name: xe
4. Pruebe la conexión haciendo clic en **Probar** (Test) y luego en **Conectar** (Connect).
### Paso 2: Abrir y Ejecutar los Scripts DDL
1. Diríjase al menú superior: **Archivo (File) > Abrir (Open)**.
2. Navegue hasta la carpeta raíz del repositorio y entre a la ruta: `/sql/ddl/`.
3. Seleccione los archivos `.sql` en el **orden estricto** mencionado en la Sección 2.
4. Para cada archivo abierto:
   * Asegúrese de seleccionar la conexión activa en la esquina superior derecha de la hoja de trabajo (Worksheet).
   * Ejecute todo el script presionando la tecla **F5** o haciendo clic en el icono **Ejecutar Script** (el icono de la hoja con el triángulo verde en la barra de herramientas).
5. Verifique en la pestaña **Salida de Script** (Script Output) que no existan errores de sintaxis o fallas de compilación.
6. Enviar cambios ejecutando el comando:
   ```sql
   COMMIT;
