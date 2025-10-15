# 📘 Explicación didáctica – Observabilidad Fase 2

Este documento está diseñado para ayudarte como instructor a explicar los conceptos clave del laboratorio de logs con Loki + Promtail + Grafana. Cada sección incluye una definición sencilla, cómo funciona, y una forma práctica de explicarlo en clase.

---

## 🎓 ¿Qué incluye este laboratorio?

### 🧹 Scraping de logs con Promtail

**¿Qué significa “scraping”?**  
Es el proceso de leer y recolectar información desde archivos de log del sistema.

**¿Cómo lo hace Promtail?**  
- Se conecta a carpetas como `/var/log/`
- Detecta archivos `.log` (como `syslog`, `auth.log`)
- Extrae línea por línea y las envía a Loki

**Ejemplo para explicar:**  
“Promtail es como un lector automático que revisa los archivos de log del sistema y los manda a Loki para que podamos analizarlos.”

---

### 📦 Almacenamiento en Loki

**¿Qué hace Loki?**  
Recibe los logs desde Promtail y los guarda en un formato optimizado para búsquedas.

**¿En qué se diferencia de otros sistemas?**  
- No indexa todo el contenido, solo las etiquetas (como `job`, `filename`)
- Es rápido, ligero y diseñado para integrarse con Grafana

**Ejemplo para explicar:**  
“Loki es como una biblioteca de logs. No guarda cada palabra en un índice, pero sí sabe dónde buscar cuando le pedimos algo.”

---

### 📊 Dashboards automáticos en Grafana

**¿Qué significa “automáticos”?**  
Los dashboards se cargan sin necesidad de crearlos manualmente.

**¿Cómo se logra?**  
- Usamos archivos `.json` con paneles predefinidos
- Grafana los detecta al iniciar gracias al provisioning

**Ejemplo para explicar:**  
“Es como entrar a una sala de control que ya tiene los monitores encendidos y configurados para mostrar lo que necesitas.”

---

### 🧪 Validación con scripts

**¿Qué validamos?**  
Que los servicios estén corriendo, que los logs se estén recolectando, y que los dashboards estén cargados.

**¿Cómo lo hacemos?**  
- Con scripts como `reset.sh` y `setup.sh`
- Ejecutan comandos Docker y muestran resultados clave

**Ejemplo para explicar:**  
“Los scripts son como botones de prueba. Uno reinicia todo, y el otro te dice si todo está funcionando bien.”

---

### 📘 Documentación didáctica para formadores y estudiantes

**¿Qué incluye?**  
Guías paso a paso, explicaciones de cada archivo, troubleshooting y preguntas frecuentes.

**¿Por qué es importante?**  
- Permite enseñar sin depender de memoria
- Ayuda a los alumnos a entender y reproducir el laboratorio

**Ejemplo para explicar:**  
“Es como tener un manual del laboratorio que no solo te dice qué hacer, sino también por qué y cómo explicarlo.”

---

## 🧠 Sugerencia para clases

Puedes usar este archivo como base para responder preguntas frecuentes, preparar presentaciones, o reforzar conceptos clave durante el laboratorio.  
También puedes convertir cada sección en una slide o ficha visual para tus alumnos.


