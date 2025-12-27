podman build -f ./Dockerfile.ubuntu_opencv -t  ubuntu_opencv:1.0 .
podman build -f ./Dockerfile.fedora_opencv -t  fedora_opencv:1.0 .

# Criando um toolbox com o Ubuntu
distrobox create --yes --nvidia \
--name ubuntu_opencv \
--image localhost/ubuntu_opencv:1.0  \
--name ubuntu_opencv

distrobox create --yes --nvidia \
--name fedora_opencv \
--image localhost/fedora_opencv:1.0  \
--name fedora_opencv

# Roda o setup para deixá-los pronto para uso.
distrobox upograde ubuntu_opencv 

distrobox upograde fedora_opencv 
