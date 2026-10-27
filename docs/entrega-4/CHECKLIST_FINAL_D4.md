# Checklist final del D4 — Entrega 4

**Proyecto:** Sistema de Gestión «La Tradición»  
**Estado:** Pendiente de integración y validación final

## A. Documentación
- [ ] Confirmar que la bitácora de IA está consolidada y subida en `docs/bitacora-ia/`.
- [ ] Revisar que la certificación de Entrega 4 refleje solo comprobaciones realizadas.
- [ ] Obtener aprobación/firma de los cuatro integrantes.
- [ ] Subir la defensa oral en `docs/entrega-4/`.
- [ ] Subir el informe de auditoría preliminar en `docs/entrega-4/`.
- [ ] Confirmar manual técnico, manual de usuario, informe final y pruebas.

## B. Auditoría Git y seguridad
- [ ] Confirmar que D1, D2, D3 y D4 subieron sus archivos.
- [ ] Comprobar estructura de carpetas obligatoria.
- [ ] Revisar `README.md`, `INSTALL.md`, `.gitignore` y `.env.example`.
- [ ] Confirmar que `.env`, `node_modules/` y secretos no estén rastreados.
- [ ] Revisar que no existan contraseñas o tokens expuestos en el repositorio o historial.
- [ ] Revisar los commits y la rama principal.
- [ ] Verificar los estándares de SQL y aplicación web.
- [ ] Confirmar una instalación limpia real y sus evidencias, si es requisito de evaluación.

## C. Defensa oral
- [ ] Confirmar reparto de temas entre los cuatro integrantes.
- [ ] Preparar diapositivas.
- [ ] Ensayar explicación de relaciones y normalización 3FN.
- [ ] Ensayar triggers, procedimientos almacenados y roles.
- [ ] Ensayar demostración: compra → producción → venta → verificación en BD.
- [ ] Preparar capturas de respaldo por si falla la conexión.

## D. Publicación oficial
- [ ] Corregir hallazgos de la auditoría.
- [ ] Confirmar que `git status` no muestra cambios pendientes que deban entregarse.
- [ ] Crear tag `entrega-4` sobre el commit definitivo.
- [ ] Publicar el tag en GitHub.
- [ ] Confirmar que el docente tiene acceso al repositorio.
- [ ] Enviar URL, tag y resumen de cambios al docente.

## Comandos para crear el tag (solo al finalizar las verificaciones)
```bash
git checkout main
git pull origin main
git status
git tag -a entrega-4 -m "Entrega 4 - La Tradición"
git push origin entrega-4
```

**Importante:** Si `entrega-4` ya existe, no sobrescribirlo sin revisar primero qué commit señala y acordarlo con el equipo.

## Criterio de cierre
La actividad D4 queda **preparada** cuando estén redactados y organizados sus documentos. Queda **terminada y verificada** únicamente cuando la auditoría final esté aprobada, la certificación cuente con las aprobaciones reales y el tag `entrega-4` esté publicado.
