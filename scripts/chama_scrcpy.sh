#!/usr/bin/env bash

# Tempo de espera entre as tentativas (em segundos)
WAIT_TIME=3

echo "📱 Iniciando processo de conexão com adb/scrcpy..."

# Loop até encontrar dispositivo
while true; do
    echo "🚀 Iniciando adb..."
    adb start-server >/dev/null 2>&1

    echo "⏳ Aguardando $WAIT_TIME segundos..."
    sleep $WAIT_TIME

    # Conta quantos dispositivos estão listados (exclui a linha de cabeçalho)
    DEVICE_COUNT=$(adb devices | sed -n '2,$p' | grep -w "device" | wc -l)

    if [[ $DEVICE_COUNT -gt 0 ]]; then
        echo "✅ Dispositivo encontrado! Iniciando scrcpy..."
        scrcpy
        break
    else
        echo "❌ Nenhum dispositivo encontrado. Reiniciando adb..."
        adb kill-server >/dev/null 2>&1
        sleep $WAIT_TIME
    fi
done

