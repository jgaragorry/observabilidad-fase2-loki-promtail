# 📘 Observabilidad Fase 2 – Logs con Grafana, Loki y Promtail

Este repositorio contiene un laboratorio didáctico para enseñar cómo recolectar, almacenar y visualizar logs del sistema en tiempo real usando **Promtail**, **Loki** y **Grafana**, integrados vía **Docker Compose**.

Aplica metodologías y buenas prácticas de **DevOps**, **SRE**, **SysOps**, **NetOps**, **DevSecOps**, **monitoring**, **telemetría**, **observabilidad**, y **FinOps**, con enfoque didáctico, reproducible y orientado a trazabilidad, debugging y análisis de eventos.

---

## 🎯 Objetivo del laboratorio

- Recolectar logs del sistema con Promtail
- Almacenarlos en Loki
- Visualizarlos automáticamente en Grafana
- Enseñar trazabilidad, filtrado y análisis de eventos
- Aplicar buenas prácticas de infraestructura, seguridad y observabilidad

---

## 🧱 Estructura del repositorio

```
observabilidad-fase2-loki-promtail/
├── docker-compose.yml
├── loki/config.yml
├── promtail/config.yml
├── grafana/
│   ├── dashboards/fase2/
│   │   ├── logs-basicos.json
│   │   └── logs-extendidos.json
│   └── provisioning/
│       ├── dashboards/dashboards.yml
│       └── datasources/datasources.yml
├── scripts/
│   ├── reset.sh
│   └── setup.sh
├── docs/
│   ├── arquitectura.md
│   ├── troubleshooting.md
│   └── preguntas-frecuentes.md
├── assets/capturas/
│   └── flujo-loki-promtail-grafana.png
├── .gitignore
└── README.md
```

---

## 🚀 ¿Cómo ejecutar el laboratorio?

1. Clona el repositorio:

   ```bash
   git clone https://github.com/tuusuario/observabilidad-fase2-loki-promtail.git
   cd observabilidad-fase2-loki-promtail
   ```

2. Reinicia el entorno limpio:

   ```bash
   ./scripts/reset.sh
   ```

3. Valida que todo esté funcionando:

   ```bash
   ./scripts/setup.sh
   ```

4. Accede a Grafana:

   ```
   http://localhost:3000
   Usuario: admin
   Contraseña: admin
   ```

5. Ve a **Dashboards → Browse → Logs – Fase 2**  
   Abre el dashboard “Logs Básicos – Fase 2” o “Logs Extendidos – Fase 2”

---

## 📊 Dashboards disponibles

### 🧩 Logs Básicos

| Panel | Descripción |
|-------|-------------|
| 📄 Logs recientes | Tabla con los últimos eventos desde `/var/log/*.log` |
| 🔍 Logs por nivel | Gráfico con conteo de logs `info`, `warn`, `error` |
| 📁 Logs por archivo | Pie chart con distribución por archivo (`syslog`, `auth.log`, etc.) |

### 🧠 Logs Extendidos

| Panel | Descripción |
|-------|-------------|
| 🧩 Logs por servicio | Pie chart con distribución por `job` |
| 🔎 Logs que contienen 'failed' | Tabla filtrada por contenido específico |
| ⏱️ Logs por timestamp | Gráfico de tasa de logs por minuto en la última hora |

✅ Ideal para enseñar cómo buscar errores, analizar actividad por servicio, y entender el comportamiento del sistema a través de logs.

---

## 🔧 ¿Qué hace cada archivo?

| Archivo | Propósito |
|--------|-----------|
| `docker-compose.yml` | Define los servicios Loki, Promtail y Grafana |
| `loki/config.yml` | Configura Loki para almacenamiento local |
| `promtail/config.yml` | Indica a Promtail qué logs leer y a dónde enviarlos |
| `logs-basicos.json` | Dashboard con 3 paneles básicos de logs |
| `logs-extendidos.json` | Dashboard con 6 paneles para trazabilidad avanzada |
| `datasources.yml` | Provisiona Loki como datasource en Grafana |
| `dashboards.yml` | Carga automáticamente los dashboards en Grafana |
| `reset.sh` | Reinicia el entorno desde cero |
| `setup.sh` | Valida que todo esté funcionando correctamente |

---

## ⚠️ Excepción en `.gitignore`

> Para esta ocasión, se realizó una excepción explícita en el archivo `.gitignore` para permitir que los archivos `.json` dentro de `grafana/dashboards/` fueran rastreados por Git y subidos al repositorio.  
> Esto garantiza que los dashboards básicos y extendidos estén disponibles para cualquier persona que clone el proyecto.

```gitignore
# ✅ Incluir dashboards y datasources
!grafana/dashboards/**/*.json
!grafana/provisioning/**/*.yml
```

---

## 🧯 Troubleshooting documentado

| Problema | Causa | Solución |
|---------|-------|----------|
| No aparecen logs | Promtail mal configurado | Verifica `__path__` en `promtail/config.yml` |
| Dashboard vacío | Datasource no vinculado | Asegúrate de usar `uid: loki` en el dashboard |
| Error de YAML | Indentación incorrecta | Validar con `yamllint` |
| Grafana no carga dashboard | Volumen mal montado | Revisa ruta en `dashboards.yml` y `docker-compose.yml` |

---

## ❓ Preguntas frecuentes

**¿Qué logs se recolectan?**  
Todos los archivos `.log` en `/var/log`, como `syslog`, `auth.log`, `dmesg`, etc.

**¿Puedo agregar logs de contenedores?**  
Sí, montando `/var/lib/docker/containers` y ajustando `__path__`.

**¿Cómo filtro por nivel?**  
Usa expresiones como `{job="varlogs"} |= "error"` en Grafana.

**¿Por qué no veo logs?**  
Verifica que Promtail esté corriendo y que los archivos `.log` existan.

---

## 🔮 Extensiones sugeridas

- Fase 3: Exporters como Node Exporter
- Fase 4: Alertas con Alertmanager
- Fase 5: Seguridad con Falco
- Fase 6: Logs de contenedores y servicios personalizados

---

## 🌐 Conecta conmigo

Aprende más sobre DevOps, observabilidad y seguridad en mis redes:

📍 LinkedIn: [https://www.linkedin.com/in/josegaragorry](https://www.linkedin.com/in/josegaragorry)  
🎬 TikTok: [https://www.tiktok.com/@softtraincorp](https://www.tiktok.com/@softtraincorp)  
📸 Instagram: [https://www.instagram.com/stclatam/#](https://www.instagram.com/stclatam/#)  
💬 WhatsApp comunidad: [https://chat.whatsapp.com/ENuRMnZ38fv1pk0mHlSixa](https://chat.whatsapp.com/ENuRMnZ38fv1pk0mHlSixa)

---

🎓 Este laboratorio forma parte de una serie didáctica para dominar observabilidad desde cero.  
Ideal para formadores, estudiantes y profesionales que buscan enseñar DevOps con impacto real.

