#!/bin/bash

declare -a all_packages=()

# Função para verificar e instalar pacotes rpm-ostree somente se não estiverem instalados
install_if_not_exists() {
    local packages=("$@")
    local to_install=()

    for pkg in "${packages[@]}"; do
        if rpm -q "$pkg" &>/dev/null; then
            echo "[✔] Pacote '$pkg' já está instalado. Ignorando..."
        else
            echo "[➕] Pacote '$pkg' será instalado."
            all_packages+=("$pkg")
        fi
    done
}

install_all_processing() {
    if [ "${#all_packages[@]}" -gt 0 ]; then
        echo "📦 Instalando pacotes: ${all_packages[*]}"
        sudo rpm-ostree install -y "${all_packages[@]}"
    else
        echo "✅ Nenhum novo pacote a instalar."
    fi
}

declare -a pkgs=(
  libvirt 
  virtiofsd 
  virt-manager 
  virt-viewer 
  virt-top 
  virt-install 
  qemu-kvm 
  libvirt-daemon-config-network 
  libvirt-daemon-kvm 
  libvirt-daemon-driver-qemu 
  libvirt-daemon-driver-network 
  libguestfs-tools 
  virt-sysprep 
  virt-clone 
  virt-rescue 
  virt-builder 
  bridge-utils 
  dnsmasq 
  virt-what 
  virt-sandbox 
  libvirt-client 
  virt-v2v 
  virt-v2v-bash-completion 
  virtiofsd )

install_if_not_exists "${pkgs[@]}"
install_all_processing ""

#sudo usermod -aG libvirt $USER

#newgrp libvirt

sudo systemctl enable --now libvirtd

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
