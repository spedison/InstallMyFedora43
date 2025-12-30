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

sudo systemctl reboot

 
