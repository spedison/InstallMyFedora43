sudo rpm-ostree -y install \
  libvirt \
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
  libvirt-client

sudo usermod -aG libvirt $USER

newgrp libvirt

sudo systemctl enable --now libvirtd

if ! grep -Fxq "# Aloca 256 páginas de 2MB (HugePages) no boot" /etc/tmpfiles.d/hugepages.conf 2>/dev/null; then
  sudo bash -c 'echo "# Aloca 256 páginas de 2MB (HugePages) no boot" >> /etc/tmpfiles.d/hugepages.conf'  
  sudo bash -c 'echo "w /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages - - - - 256" >> /etc/tmpfiles.d/hugepages.conf'
else
  echo "As entradas de HugePages já estão configuradas em /etc/tmpfiles.d/hugepages.conf"
fi

sudo systemd-tmpfiles --create /etc/tmpfiles.d/hugepages.conf
