# 🧪 Guía de Uso – Observabilidad Fase 2 con Grafana, Loki y Promtail

Este repositorio contiene un laboratorio didáctico para enseñar cómo recolectar, almacenar y visualizar logs usando Promtail, Loki y Grafana. Está diseñado para ser reproducible, modular y fácil de extender.

---

## 📦 Estructura del Proyecto

```
observabilidad-fase2-loki-promtail/
├── grafana/
│   ├── dashboards/
│   │   └── fase2/
│   │       ├── logs-basicos.json
│   │       └── logs-extendidos.json
│   └── provisioning/
│       ├── dashboards/
│       │   └── dashboards.yml
│       └── datasources/
│           └── datasources.yml
├── loki/
│   └── config.yml
├── promtail/
│   └── config.yml
├── scripts/
│   ├── reset.sh
│   └── setup.sh
├── docker-compose.yml
├── README.md
├── README-GUIA.md
└── docs/
    ├── arquitectura.md
    ├── troubleshooting.md
    └── preguntas-frecuentes.md
```

---

## 🚀 Cómo ejecutar el laboratorio

1. Clona el repositorio:
   ```bash
   git clone https://github.com/jgaragorry/observabilidad-fase2-loki-promtail.git
   cd observabilidad-fase2-loki-promtail
   ```

2. Reinicia el entorno (opcional):
   ```bash
   ./scripts/reset.sh
   ```

3. Levanta los servicios:
   ```bash
   ./scripts/setup.sh
   ```

4. Accede a Grafana:
   ```
   http://localhost:3000
   Usuario: admin
   Contraseña: admin
   ```

---

## 📊 Dashboards disponibles

- `Logs Básicos – Fase 2`: muestra logs recientes, por nivel (`error`, `warn`, `info`) y por archivo.
- `Logs Extendidos – Fase 2`: incluye visualizaciones por servicio (`job`), logs que contienen `"failed"`, frecuencia por timestamp, y paneles tipo `piechart` y `table`.

---

## 🧭 Flujo de Carga y Lectura de Archivos

Este bloque explica qué hace cada archivo de configuración del laboratorio, cómo se relacionan entre sí, y en qué orden se leen. Está diseñado para facilitar la comprensión del stack y asegurar su correcta reproducción.

### 🐳 1. `docker-compose.yml`
- **Rol:** Define los servicios del laboratorio: Grafana, Loki y Promtail.
- **Lectura:** Es el punto de entrada. Al ejecutar `docker-compose up`, se crean los contenedores y se montan los volúmenes.

### 🔧 2. `promtail/config.yml`
- **Rol:** Configura qué archivos de log se recolectan y cómo se etiquetan (`job`, `filename`, etc.).
- **Lectura:** Promtail lo usa al iniciar. Si está mal configurado, no verás logs en Grafana.

### 🔧 3. `loki/config.yml`
- **Rol:** Define cómo Loki almacena y organiza los logs recibidos desde Promtail.
- **Lectura:** Loki lo interpreta al arrancar. Afecta el rendimiento y la retención de logs.

### 📁 4. `grafana/provisioning/datasources/datasources.yml`
- **Rol:** Provisiona automáticamente la conexión de Grafana con Loki como fuente de datos.
- **Lectura:** Grafana lo lee al iniciar. Si está bien configurado, no necesitas agregar la fuente manualmente.

### 📁 5. `grafana/provisioning/dashboards/dashboards.yml`
- **Rol:** Indica a Grafana dónde buscar los dashboards `.json` para cargarlos automáticamente.
- **Lectura:** Grafana lo interpreta al arrancar. Si el path está bien definido, carga todos los dashboards sin intervención manual.

### 📊 6. `grafana/dashboards/fase2/logs-basicos.json`
- **Rol:** Dashboard básico para visualizar logs recientes, por nivel (`error`, `warn`, `info`) y por archivo.
- **Lectura:** Grafana lo carga al iniciar, si está referenciado correctamente en `dashboards.yml`.

### 📊 7. `grafana/dashboards/fase2/logs-extendidos.json`
- **Rol:** Dashboard extendido con visualizaciones adicionales:
  - Logs por servicio (`job`)
  - Logs que contienen `"failed"`
  - Frecuencia por timestamp
  - Paneles tipo `piechart` y `table`
- **Lectura:** Grafana lo carga junto al básico. Ideal para análisis más profundo y enseñanza didáctica.

### 🧹 8. `scripts/reset.sh`
- **Rol:** Reinicia el entorno: elimina contenedores, redes y volúmenes. Ideal para empezar de cero.

### 🧪 9. `scripts/setup.sh`
- **Rol:** Valida que los contenedores estén activos, que los dashboards se hayan cargado, y que Promtail esté recolectando logs.

---

### ⚠️ Excepción en `.gitignore`

> Para esta ocasión, se realizó una excepción explícita en el archivo `.gitignore` para permitir que los archivos `.json` dentro de `grafana/dashboards/` fueran rastreados por Git y subidos al repositorio.  
> Esto garantiza que los dashboards básicos y extendidos estén disponibles para cualquier persona que clone el proyecto.

```gitignore
# ✅ Incluir dashboards y datasources
!grafana/dashboards/**/*.json
!grafana/provisioning/**/*.yml
```

---

### 🧠 Orden de lectura recomendado

```plaintext
1. docker-compose.yml → crea servicios
2. promtail/config.yml → recolecta logs
3. loki/config.yml → almacena logs
4. datasources.yml → Grafana conecta con Loki
5. dashboards.yml → Grafana busca dashboards
6. logs-basicos.json → dashboard básico
7. logs-extendidos.json → dashboard extendido
8. reset.sh → reinicia entorno
9. setup.sh → valida estado
```

---

## 📚 Recursos adicionales

- [docs/arquitectura.md](docs/arquitectura.md): explicación técnica del stack
- [docs/troubleshooting.md](docs/troubleshooting.md): errores comunes y cómo resolverlos
- [docs/preguntas-frecuentes.md](docs/preguntas-frecuentes.md): dudas frecuentes de alumnos

---

¿Quieres extender el laboratorio con métricas, alertas o trazas? Puedes crear una nueva fase y reutilizar esta estructura como base.

