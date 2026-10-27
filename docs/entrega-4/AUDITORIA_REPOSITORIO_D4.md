# Auditoría del repositorio — Entrega 4

**Proyecto:** Sistema de Gestión «La Tradición»  
**Repositorio:** https://github.com/Andyl4566/sistema-laTradicion-proyecto  
**Responsable:** Desarrollador 4 (coordinación de calidad)  
**Fecha de elaboración:** 23/10/2026  
**Estado:** PRELIMINAR — pendiente de revisión final después de integrar los aportes de D1, D2, D3 y D4.

## Objetivo
Verificar que la versión definitiva de la Entrega 4 cumpla la estructura solicitada, las reglas de calidad del código, la documentación, la seguridad del repositorio y los requisitos de control de versiones.

## Alcance y criterio
Esta es una **plantilla de auditoría previa al cierre**, no una constancia de cumplimiento total. La información proporcionada por el equipo indica que los archivos de la Entrega 4 todavía no han sido subidos por todos los desarrolladores. Ninguna casilla pendiente equivale a una falla comprobada.

## Lista de auditoría

| N.º | Aspecto a verificar | Estado | Evidencia requerida |
|---|---|---|---|
| 1 | Carpetas `docs/`, `sql/` y `web/` y subcarpetas obligatorias | Pendiente de verificación final | Árbol de archivos en `main` |
| 2 | `README.md` e `INSTALL.md` completos y actualizados | Pendiente | Lectura de ambos archivos |
| 3 | `.env.example` contiene solo nombres de variables o valores ficticios | Pendiente | Inspección del archivo |
| 4 | `.gitignore` excluye `.env`, `node_modules/`, temporales y secretos | Pendiente | Revisión de patrones y archivos rastreados |
| 5 | No hay contraseñas, tokens o claves reales en archivos ni historial | Pendiente | Revisión de contenido e historial Git |
| 6 | Scripts SQL organizados y documentados | Pendiente | `sql/ddl`, `dml`, `views`, `triggers`, `procedures`, `security` |
| 7 | Código web con validación, protección de rutas y consultas seguras | Pendiente | Revisión de archivos relevantes y pruebas |
| 8 | Manual técnico, manual de usuario e informe final | Pendiente | Archivos integrados en `docs/entrega-4/` |
| 9 | Casos de prueba y evidencia de ejecución | Pendiente | Registros y capturas de pruebas |
| 10 | Bitácora IA consolidada | Pendiente de confirmar archivo final | `docs/bitacora-ia/BITACORA_IA.md` |
| 11 | Certificación de Entrega 4 aprobada por cuatro integrantes | Pendiente de firmas | `docs/certificaciones/CERTIFICACION_ENTREGA_4.md` |
| 12 | Instalación limpia ejecutada realmente | Pendiente | Acta o evidencia de instalación real |
| 13 | Commits de los integrantes y rama principal preparada | Pendiente | Historial Git y `git status` |
| 14 | Tag oficial `entrega-4` sobre el commit final | No realizado | `git tag -l` y enlace del tag |
| 15 | Acceso del catedrático al repositorio y al tag | Pendiente | Confirmación de acceso |

## Observaciones
- El equipo informó que los archivos correspondientes a la Entrega 4 aún no están integrados por todos los desarrolladores.
- Se preparó documentación de una **instalación simulada**; esto no sustituye una instalación limpia ejecutada y comprobada.
- Si `node_modules/` está rastreado por Git, se recomienda retirarlo del índice y mantenerlo excluido mediante `.gitignore`.
- Deben revisarse credenciales de demostración o predeterminadas, especialmente si la aplicación está publicada en Internet. Quitar credenciales visibles de una pantalla no equivale a cambiar contraseñas existentes.

## Comandos sugeridos para la revisión final
```bash
git status
git ls-files
git ls-files .env node_modules
git log --oneline -10
git tag -l
```

> Los comandos anteriores son orientativos. Para verificar secretos, revisar también los archivos e historial de manera segura. No copiar contraseñas reales al informe.

## Dictamen
**Auditoría preliminar documentada. Auditoría final: PENDIENTE.**

El D4 podrá declarar el repositorio conforme cuando se hayan cargado los entregables, comprobado los controles de seguridad, completado las evidencias y registrado el tag oficial.

**Revisó:** __________________________  
**Fecha de revisión final:** __________________________
