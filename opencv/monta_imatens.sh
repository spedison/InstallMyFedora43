# criando as imagens
podman build -f Dockerfile.ubuntu_opencv -t ubuntu_opencv:1.0 .

podman build -f Dockerfile.fedora_opencv -t fedora_opencv:1.0 .

# Criando os containeres
distrobox create --yes --nvidia --name ubuntu_opencv --image localhost/ubuntu_opencv:1.0

distrobox create --yes --nvidia --name fedora_opencv --image localhost/fedora_opencv:1.0

# Atualiza os containeres e o Setup
distrobox upgrade ubuntu_opencv

distrobox upgrade fedora_opencv

# Para usar os containeres
# distrobox enter ubuntu_opencv
# distrobox enter fedora_opencv

