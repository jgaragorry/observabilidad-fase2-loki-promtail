#!/bin/bash

echo "🔍 Validando estado del laboratorio – Fase 2"

echo ""
echo "📦 Contenedores activos:"
docker ps --filter "name=loki" --filter "name=promtail" --filter "name=grafana"

echo ""
echo "📁 Archivos montados en Grafana:"
docker exec observabilidad-fase2-loki-promtail-grafana-1 sh -c "ls /etc/grafana/provisioning/datasources"
docker exec observabilidad-fase2-loki-promtail-grafana-1 sh -c "ls /etc/grafana/provisioning/dashboards"
docker exec observabilidad-fase2-loki-promtail-grafana-1 sh -c "ls /var/lib/grafana/dashboards/fase2"

echo ""
echo "📄 Logs de Grafana (últimos 10 relacionados con dashboards):"
docker logs observabilidad-fase2-loki-promtail-grafana-1 2>&1 | grep dashboard | tail -n 10

echo ""
echo "📡 Logs recientes desde Loki (vía Promtail):"
docker logs observabilidad-fase2-loki-promtail-promtail-1 2>&1 | tail -n 10

echo ""
echo "✅ Validación completa. Accede a Grafana en: http://localhost:3000"
echo "Usuario: admin"
echo "Contraseña: admin"

