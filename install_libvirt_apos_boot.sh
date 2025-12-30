#!/bin/bash

# Verifica se o grupo docker existe em /etc/group
if ! grep -q "^libvirt:" /etc/group 2>/dev/null; then
      echo "  ℹ️  Grupo 'libvirt' não está em /etc/group, copiando de /usr/lib/group..."
      
      # Extrai a linha do grupo docker de /usr/lib/group
      if sudo bash -c 'grep "^libvirt:" /usr/lib/group >> /etc/group 2>/dev/null'; then
          echo "  ✅ Grupo 'libvirt' copiado com sucesso mantendo o GID original"
      fi
else
      echo "  ℹ️  Grupo 'libvirt' já existe em /etc/group"
fi

if ! grep -Fxq "# Aloca 256 páginas de 2MB (HugePages) no boot" /etc/tmpfiles.d/hugepages.conf 2>/dev/null; then
  sudo bash -c 'echo "# Aloca 256 páginas de 2MB (HugePages) no boot" >> /etc/tmpfiles.d/hugepages.conf'  
  sudo bash -c 'echo "w /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages - - - - 256" >> /etc/tmpfiles.d/hugepages.conf'
else
  echo "As entradas de HugePages já estão configuradas em /etc/tmpfiles.d/hugepages.conf"
fi

sudo systemd-tmpfiles --create /etc/tmpfiles.d/hugepages.conf
