# 🧯 Troubleshooting – Fase 2

| Problema | Causa | Solución |
|---------|-------|----------|
| No aparecen logs | Promtail mal configurado | Verifica `__path__` en `promtail/config.yml` |
| Dashboard vacío | Datasource no vinculado | Asegúrate de usar `uid: loki` en el dashboard |
| Error de YAML | Indentación incorrecta | Validar con `yamllint` |
| Grafana no carga dashboard | Volumen mal montado | Revisa ruta en `dashboards.yml` y `docker-compose.yml` |

