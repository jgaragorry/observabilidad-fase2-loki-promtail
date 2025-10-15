# 🧠 Arquitectura – Fase 2: Logs con Loki + Promtail

Este laboratorio recolecta logs del sistema usando Promtail, los envía a Loki, y los visualiza en Grafana. El flujo es:

Promtail → Loki → Grafana

- Promtail lee archivos `.log` desde `/var/log`
- Loki almacena y permite consultar los logs
- Grafana muestra los logs en dashboards filtrables

Ideal para enseñar trazabilidad, debugging y observabilidad real.

