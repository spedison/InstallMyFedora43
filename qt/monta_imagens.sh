# criando a imagem
podman build -f Dockerfile.fedora_qt -t fedora_qt:1.0 .

# Criando os containeres
distrobox create --yes --nvidia --name fedora_qt --image localhost/fedora_qt:1.0

# Atualiza os containeres e o Setup
distrobox upgrade fedora_qt

# Para usar os containeres
# distrobox enter fedora_qt
