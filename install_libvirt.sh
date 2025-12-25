sudo rpm-ostree -y install \
  libvirt \
  virtiofsd \
  virt-manager \
  virt-viewer \
  virt-top \
  virt-install \
  qemu-kvm \
  libvirt-daemon-config-network \
  libvirt-daemon-kvm \
  libvirt-daemon-driver-qemu \
  libvirt-daemon-driver-network \
  libguestfs-tools \
  virt-sysprep \
  virt-clone \
  virt-rescue \
  virt-builder \
  bridge-utils \
  dnsmasq \
  virt-what \
  virt-sandbox \
  libvirt-client \
  virt-v2v \
  virt-v2v-bash-completion \
  virtiofsd \
  

#sudo usermod -aG libvirt $USER

#newgrp libvirt

sudo systemctl enable --now libvirtd

 # Verifica se o grupo docker existe em /etc/group
  if ! grep -q "^libvirt:" /etc/group 2>/dev/null; then
      echo "  ℹ️  Grupo 'libvirt' não está em /etc/group, copiando de /usr/lib/group..."
      
      # Extrai a linha do grupo docker de /usr/lib/group
      if sudo bash -c 'grep "^libvirt:" /usr/lib/group >> /etc/group 2>/dev/null'; then
          echo "  ✅ Grupo 'libvirt' copiado com sucesso mantendo o GID original"
      #else
      #    echo "  ⚠️  Não encontrou grupo docker em /usr/lib/group, criando novo..."
      #    sudo groupadd docker || echo "  ⚠️  Erro ao criar grupo"
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
