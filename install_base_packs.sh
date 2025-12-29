#!/bin/bash

# Função para verificar e instalar pacotes rpm-ostree somente se não estiverem instalados
install_if_not_exists() {
    local packages=("$@")
    local to_install=()

    for pkg in "${packages[@]}"; do
        if rpm -q "$pkg" &>/dev/null; then
            echo "[✔] Pacote '$pkg' já está instalado. Ignorando..."
        else
            echo "[➕] Pacote '$pkg' será instalado."
            to_install+=("$pkg")
        fi
    done

    if [ "${#to_install[@]}" -gt 0 ]; then
        echo "📦 Instalando pacotes: ${to_install[*]}"
        sudo rpm-ostree install -y "${to_install[@]}"
    else
        echo "✅ Nenhum novo pacote a instalar."
    fi
}

# ------------------------------------------
# Vim e plugins, versão gráfica GTK
# Terminal tools: htop, mc
# Ferramentas Android
# ------------------------------------------
vim_tools=(
    vim-gtk-syntax vim-gv vim-enhanced awesome-vim-colorschemes
    perl-Text-VimColor vim-go vim-latex vim-X11
    htop mc android-tools
)
install_if_not_exists "${vim_tools[@]}"

# ------------------------------------------
# Apps gráficos para comparação e automação
# ------------------------------------------
#gui_tools=(
#    meld wtype swaymsg wlrctl
#)
#install_if_not_exists "${gui_tools[@]}"

# ------------------------------------------
# Manipulação de imagens via CLI
# ------------------------------------------
imagemagick_tools=(
    ImageMagick ImageMagick-c++ ImageMagick-c++-devel vips-magick
    ImageMagick-doc ImageMagick-devel
)
install_if_not_exists "${imagemagick_tools[@]}"

# ------------------------------------------
# Conversor WebP
# ------------------------------------------
webp_tools=(
    libwebp libwebp-devel libwebp-java libwebp-tools
)
install_if_not_exists "${webp_tools[@]}"

# ------------------------------------------
# Monitoramento de sites e ferramentas de rede/SSH
# ------------------------------------------
network_tools=(
    urlwatch net-tools openssh-client openssh-server nmap nmap-ncat
)
install_if_not_exists "${network_tools[@]}"

# ------------------------------------------
# Graphviz, suporte a mouse Logitech, LaTeX
# ------------------------------------------
latex_and_graphics=(
    graphviz ghc-graphviz solaar logiops texlive-scheme-full
    texmaker texworks latexmk tgif 

)
install_if_not_exists "${latex_and_graphics[@]}"

# ------------------------------------------
# Distrobox e ferramentas para C++/Rust (desenv.)
# ------------------------------------------
dev_tools=(
    distrobox checkmake cmake-fedora cmrc-devel ignition-cmake-devel
    c4project llvm-cmake-utils cmake-data cmake-doc cmake-filesystem
    cmake-gui cmake-rpm-macros cmake-srpm-macros extra-cmake-modules
    gcc-c++ gcc-gdb-plugin gcc-plugin-annobin gcc-plugin-devel libgccjit
    libgccjit-devel libgomp-offload-amdgcn libgomp-offload-nvptx
    libquadmath libquadmath-devel rust rust-analyzer gdb

    # Rust crates/tools
    rust-actix-web+__compress-devel rust-actix-web+__tls-devel
    rust-actix-web+actix-tls-devel rust-actix-web+compat-devel
    rust-actix-web+compress-gzip-devel rust-actix-web+cookies-devel
    rust-actix-web+default-devel rust-actix-web+http2-devel
    rust-actix-web+macros-devel rust-argmax-devel rust-argon2-devel
    aw-server-rust bindgen-cli cargo cargo-insta cargo-rpm-macros
    cbindgen clippy rust-addr2line-devel rust-addr2line+std-devel
    rust-addr2line+smallvec-devel
)
install_if_not_exists "${dev_tools[@]}"

# ------------------------------------------
# Silver Searcher, gráficos via linha de comando
# Manipula teclado e mouse via linha de comando
# ------------------------------------------
cli_utils=(
    the_silver_searcher gnuplot gnuplot-common gnuplot-minimal
    gnuplot-wx gnuplot-doc gnuplot-latex wtype ydotool
)
install_if_not_exists "${cli_utils[@]}"

# ------------------------------------------
# Base GoLang
# ------------------------------------------
golang_packages=(
    golang golang-bin golang-docs golang-github-alecthomas-kong-devel
    golang-shared golang-misc golang-src golang-tests golangci-lint
    compat-golang-github-codegangsta-cli-devel
    compat-golang-github-coreos-clair-devel
    compat-golang-github-coreos-oidc-3-devel
    compat-golang-github-docopt-devel
    compat-golang-github-facebook-ent-devel
    godoctor glide
)
install_if_not_exists "${golang_packages[@]}"
