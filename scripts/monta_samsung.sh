#!/bin/bash

echo "⏳ Buscando dispositivos Samsung com MTP conectados..."

# Lista todas as entradas Samsung com MTP
_DEVICES=$(lsusb | grep -i "Samsung" | grep -i "MTP")

if [[ -z "$_DEVICES" ]]; then
    echo "❌ Nenhum dispositivo Samsung MTP foi encontrado."
    exit 1
fi

# Processa cada linha (um dispositivo)
echo "$_DEVICES" | while read -r line; do
    # Extrai endereço do dispositivo em formato Bus/Device
    BUS=$(echo "$line" | awk '{print $2}')
    DEV=$(echo "$line" | awk '{print $4}' | sed 's/://')

    DEVICE_PATH="/dev/bus/usb/$BUS/$DEV"

    echo "🔍 Dispositivo detectado em: $DEVICE_PATH"

    # Verifica se o arquivo existe
    if [[ -e "$DEVICE_PATH" ]]; then
        PERMS=$(stat -c "%a" "$DEVICE_PATH")
	echo "Permissões atuais : $PERMS"
        if [[ "$PERMS" != "777" ]]; then
            echo "🛠️  Alterando permissões de $DEVICE_PATH para 777..."
            sudo chmod 777 "$DEVICE_PATH"
        else
            echo "✅ Permissões já estão corretas (777)"
        fi
    else
        echo "⚠️  Caminho não encontrado: $DEVICE_PATH"
    fi
done

echo "✅ Permissões ajustadas. Agora você pode acessar os dispositivos pelo Nautilus."

