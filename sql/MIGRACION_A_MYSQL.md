# Migración de la web: Oracle -> MySQL

Adaptación realizada usando como referencia `sql/ddl/bd_tradicion_mysql.sql`.

## Archivos principales modificados
- `package.json`: se elimina `oracledb` y se agrega `mysql2`.
- `.env` y `.env.example`: puerto 3306, esquema `bd_tradicion`.
- `web/config/database.js`: pool MySQL con `mysql2/promise`.
- `web/config/envConfig.js`: valores predeterminados MySQL.
- `web/models/userModel.js`: parámetros `?`, `CURRENT_TIMESTAMP` y nombres snake_case.
- `web/models/clienteModel.js`: elimina `SEQ_CLIENTE.NEXTVAL` y usa `AUTO_INCREMENT`.
- `web/models/proveedorModel.js`: elimina `SEQ_PROVEEDOR.NEXTVAL` y usa `AUTO_INCREMENT`.
- `web/controllers/authController.js`: actualizado para MySQL.
- `web/app.js`: mensajes de conexión actualizados a MySQL.

## Antes de iniciar
Edita `.env` y coloca tu contraseña real de MySQL:

```env
DB_PASSWORD=TU_CONTRASENA
```

Después ejecuta:

```bash
npm install
npm start
```
