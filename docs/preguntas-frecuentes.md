# ❓ Preguntas frecuentes – Fase 2

**¿Qué logs se recolectan?**  
Todos los archivos `.log` en `/var/log`, como `syslog`, `auth.log`, `dmesg`, etc.

**¿Puedo agregar logs de contenedores?**  
Sí, montando `/var/lib/docker/containers` y ajustando `__path__`.

**¿Cómo filtro por nivel?**  
Usa expresiones como `{job="varlogs"} |= "error"` en Grafana.

**¿Por qué no veo logs?**  
Verifica que Promtail esté corriendo y que los archivos `.log` existan.

