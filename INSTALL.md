Guía de Instalación y Despliegue de Base de Datos - Entrega 2
Este documento detalla el procedimiento paso a paso para la creación e instalación de la base de datos relacional del proyecto en MySQL utilizando MySQL Workbench. La estructura fue migrada desde el diseño realizado originalmente en Oracle y adaptada a sintaxis compatible con MySQL, manteniendo la nomenclatura snake_case, claves primarias, claves foráneas y restricciones.
1. Requisitos Previos
Antes de ejecutar los scripts de instalación, asegúrese de contar con las siguientes herramientas configuradas:
• SGBD: MySQL Server 8.0 o superior.
• Cliente GUI: MySQL Workbench 8.0 o superior.
• Usuario de BD: cuenta con permisos para crear bases de datos, tablas, índices y restricciones.
• Repositorio clonado: acceso a los archivos ubicados en la carpeta /sql/ddl/.
• Script DDL actualizado: bd_tradicion_mysql.sql.
2. Script de Instalación
Para la Entrega 2 se utiliza un script consolidado de creación de la base de datos. El archivo contiene la estructura necesaria para crear las tablas y sus relaciones en MySQL.
/sql/ddl/bd_tradicion_mysql.sql
El script fue adaptado desde Oracle a MySQL. Se sustituyeron tipos de datos y elementos específicos de Oracle, y se conservaron las restricciones necesarias para mantener la integridad referencial.
3. Instrucciones de Despliegue en MySQL Workbench
Paso 1: Conexión al servidor MySQL
1. Abra MySQL Workbench.
2. Seleccione una conexión existente al servidor local de MySQL o cree una nueva conexión.
3. Ingrese los datos correspondientes a su instalación. Una configuración local típica utiliza:
Hostname: localhost
Port: 3306
Username: root
4. Pruebe la conexión y abra el editor SQL.
Paso 2: Crear y seleccionar la base de datos
En una nueva pestaña SQL, ejecute:
CREATE DATABASE IF NOT EXISTS bd_tradicion;
USE bd_tradicion;
También puede seleccionar el esquema bd_tradicion desde el panel SCHEMAS una vez creado.
Paso 3: Abrir y ejecutar el script DDL
1. Diríjase al menú File > Open SQL Script.
2. Navegue hasta la carpeta /sql/ddl/ del repositorio.
3. Seleccione el archivo bd_tradicion_mysql.sql.
4. Verifique que el esquema activo sea bd_tradicion.
5. Ejecute todo el script utilizando el botón del rayo (Execute) de MySQL Workbench.
6. Revise el panel Output para comprobar que no existan errores durante la ejecución.
4. Verificación de la Instalación
Después de ejecutar el script, actualice el panel SCHEMAS y compruebe la creación de las tablas.
Puede ejecutar las siguientes consultas de verificación:
USE bd_tradicion;
SHOW TABLES;
Para comprobar que los datos existentes fueron cargados correctamente, puede ejecutar:
SELECT * FROM cliente;
SELECT * FROM proveedor;
SELECT * FROM usuarios;
La instalación se considera correcta cuando las tablas aparecen en el esquema, las consultas se ejecutan sin errores y las relaciones de claves foráneas se encuentran creadas.
5. Verificación de Integridad y Nomenclatura
• Las tablas y columnas deben mantener nomenclatura snake_case.
• Las claves primarias (PK) deben identificar de forma única cada registro.
• Las claves foráneas (FK) deben conservar las relaciones definidas en el modelo relacional.
• Las restricciones CHECK, UNIQUE y NOT NULL deben validarse según corresponda.
• El script ejecutado debe coincidir con el modelo relacional, la documentación de 3FN y el diccionario de datos.
6. Archivos Relacionados con la Entrega 2
• /sql/ddl/bd_tradicion_mysql.sql: script DDL ejecutable en MySQL.
• Diccionario de datos: documentación de tablas, columnas, tipos de datos y restricciones.
• Documentación de normalización: evidencia del proceso hasta Tercera Forma Normal (3FN).
• Diagrama relacional: representación de tablas, claves y relaciones.
• Bitácora de IA: registro de consultas, resultados, validaciones y estándares aplicados.
7. Consideraciones Finales
Antes de realizar la entrega, el grupo debe ejecutar el script en MySQL Workbench desde una base de datos limpia, verificar que no existan errores y confirmar que el SQL implementado sea coherente con el modelo relacional, el diccionario de datos y la documentación de normalización.
