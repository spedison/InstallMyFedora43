# Lista global de pacotes a instalar
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

cuda_packs=(akmod-nvidia
  xorg-x11-drv-nvidia-cuda-libs	
  xorg-x11-drv-nvidia-cuda
  nvidia-xconfig
  xorg-x11-drv-nvidia-devel
  xorg-x11-drv-nvidia-libs
  xorg-x11-drv-nvidia-xorg-libs
  criu-cuda-plugin)

install_if_not_exists "${cuda_packs[@]}"
install_all_processing ""
