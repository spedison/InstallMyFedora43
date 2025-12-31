#!/bin/bash

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

# ------------------------------------------
# Vim e plugins, versão gráfica GTK
# Terminal tools: htop, mc
# Ferramentas Android
# ------------------------------------------
vim_tools=(
    vim-gtk-syntax vim-gv
    vim-enhanced awesome-vim-colorschemes
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
    ImageMagick ImageMagick-c++
    ImageMagick-c++-devel vips-magick
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
    urlwatch net-tools openssh-clients openssh-server nmap nmap-ncat
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
    glide
)

install_if_not_exists "${golang_packages[@]}"

# Temas e ferramentas de customização do gnome
# Algumas ferramentas do gnome para desenvolvimento
themes=(
We10X-icon-theme
breeze-cursor-theme
breeze-icon-theme
breeze-icon-theme-fedora
candy-icon-theme
cosmic-icon-theme
dogtag-pki-theme
gnome-shell-theme-yaru
grub2-breeze-theme
icewm-themes
ipsilon-theme-Fedora
ipsilon-theme-openSUSE
kf6-kiconthemes
kf6-kiconthemes-html
luv-icon-theme
lxqt-themes
lxqt-themes-fedora
ocean-sound-theme
oxygen-cursor-themes
plymouth-theme-breeze
python3-conda-sphinx-theme
python3-pydata-sphinx-theme
python3-sphinx-book-theme
sweet-gtk-theme
yaru-gtk2-theme
yaru-gtk3-theme
yaru-gtk4-theme
yaru-gtksourceview-theme
yaru-icon-theme
yaru-sound-theme
yaru-theme
NsCDE-icon-theme
adw-gtk3-theme
adwaita-cursor-theme
adwaita-gtk2-theme
adwaita-icon-theme
arc-theme
arc-theme-plank
beefy-miracle-kde-theme
bluebird-gtk2-theme
bluebird-gtk3-theme
bluebird-metacity-theme
bluebird-xfwm4-theme
We10X-icon-theme
breeze-cursor-theme
breeze-icon-theme
breeze-icon-theme-fedora
breeze-icon-theme-rcc
candy-icon-theme
cosmic-icon-theme
dogtag-pki-theme
gnome-shell-theme-yaru
grantleetheme
grub2-breeze-theme
icewm-themes
ipsilon-theme-Fedora
ipsilon-theme-openSUSE
kf6-kiconthemes
kf6-kiconthemes-html
luv-icon-theme
lxqt-themes
lxqt-themes-fedora
ocean-sound-theme
oxygen-cursor-themes
plymouth-theme-breeze
python3-conda-sphinx-theme
python3-pydata-sphinx-theme
python3-sphinx-book-theme
sweet-gtk-theme
yaru-gtk2-theme
yaru-gtk3-theme
yaru-gtk4-theme
yaru-gtksourceview-theme
yaru-icon-theme
yaru-sound-theme
yaru-theme
NsCDE-icon-theme
adw-gtk3-theme
adwaita-cursor-theme
adwaita-gtk2-theme
adwaita-icon-theme
arc-theme
arc-theme-plank
beefy-miracle-kde-theme
bluebird-gtk2-theme
We10X-icon-theme
breeze-cursor-theme
breeze-icon-theme
breeze-icon-theme-fedora
candy-icon-theme
cosmic-icon-theme
dogtag-pki-theme
gnome-shell-theme-yaru
grub2-breeze-theme
icewm-themes
ipsilon-theme-Fedora
ipsilon-theme-openSUSE
kf6-kiconthemes
kf6-kiconthemes-html
luv-icon-theme
lxqt-themes
lxqt-themes-fedora
ocean-sound-theme
oxygen-cursor-themes
plymouth-theme-breeze
python3-conda-sphinx-theme
python3-pydata-sphinx-theme
python3-sphinx-book-theme
sweet-gtk-theme
gnome-tweaks
gnome-shell-extension-blur-my-shell
gnome-pomodoro
gnome-shell-extension-pop-shell
gnome-shell-extension-pop-shell-shortcut-overrides
gnome-shell-extension-netspeed
gnome-shell-extension-gsconnect
gnome-shell-extension-dash-to-panel
gnome-shell-extension-vertical-workspaces
gnome-shell-extension-forge
gnome-commander
gnome-builder-devel
gnome-builder
)

install_if_not_exists "${themes[@]}"

# O que é necessário para deixar o CUDA e a placa de video funcionando
# Para isso funcionar chame script com o parâmetro nvidia
video=(
    akmod-nvidia 
    kmod-nvidia
    xorg-x11-drv-nvidia-cuda 
    xorg-x11-drv-nvidia-devel 
    xorg-x11-drv-nvidia-libs
    xorg-x11-drv-nvidia
)

if [[ $1 -eq "nvidia" ]]; then
  install_if_not_exists "${video[@]}"
fi

install_all_processing ""

if [[ $1 -eq "nvidia" ]]; then
####################################################################################
### TODO: Verificar se o Kernel já recebe esses parâmetros usando por exemplo :::
### $ rpm-ostree kargs
### ostree-boot-kargs-v0
### --append=rd.driver.blacklist=nouveau,nova-core
### --append=modprobe.blacklist=nouveau,nova-core
### --append=nvidia-drm.modeset=1
### --append=initcall_blacklist=simpledrm_platform_driver_init
###      ------- Para que não seja necessário rodar novamente.
###      ------- Para memover algum parâmetro ::: Ex.: sudo rpm-ostree kargs --delete=initcall_blacklist=simpledrm_platform_driver_init
###################################################################################
  rpm-ostree kargs --append=rd.driver.blacklist=nouveau,nova-core --append=modprobe.blacklist=nouveau,nova-core --append=nvidia-drm.modeset=1 --append=initcall_blacklist=simpledrm_platform_driver_init
fi
## Veja ref em: https://docs.fedoraproject.org/pt/fedora-silverblue/troubleshooting/#_using_nvidia_drivers
