#!/bin/bash

echo "🧹 Reiniciando laboratorio de observabilidad – Fase 2 (Loki + Promtail)..."
docker-compose down -v
docker-compose up -d

echo ""
echo "✅ Entorno recreado. Ejecuta ./scripts/setup.sh para validar."

