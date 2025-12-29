#!\bin\bash

# Vim e alguns plugins e sua versão Gráfica GTK
# Ferramentas de terminal HTOP e mc
# Ferramentas para trabalhar com Android.
sudo rpm-ostree -y install  \
                   vim-gtk-syntax vim-gv  \
                   vim-enhanced awesome-vim-colorschemes \
                   perl-Text-VimColor vim-go \
                   vim-latex vim-X11 \
                   htop mc android-tools



# App para comparação de diretórios e arquivos 
# em uma interface gráfica amigável.

# https://github.com/jordansissel/xdotool/
# Automação de Janela, Telcado e Mouse.

# Aplicativo para listar mover janelas. 
# https://linuxvox.com/blog/what-are-the-alternatives-to-wmctrl/#comparison-table-choosing-the-right-tool
# 

# Aplicativo de manutenção de Rede
sudo rpm-ostree -y install  meld wtype swaymsg wlrctl

# ImageMagick : Apps para manipulação de imagens 
# usando linha de comando
# https://imagemagick.org
sudo rpm-ostree -y install ImageMagick ImageMagick-c++ \
ImageMagick-c++-devel vips-magick ImageMagick-doc \
ImageMagick-devel

# App que converte webp em jpg
# Exemplo : 
sudo rpm-ostree -y install libwebp libwebp-devel libwebp-java libwebp-tools 

# Este programa monitora mudança de sites e te envia o resultado por e-mail
# Via linha de comando ou Script.
# https://packages.fedoraproject.org/pkgs/urlwatch/urlwatch/

# ferramentas básicas de rede 

# Ferramentas de SSh

# Mapear a rede com serviços e IPs
# Exemplo : sudo nmap -sS 192.xx.xx.0/24
sudo rpm-ostree -y install urlwatch net-tools \
                   openssh-client openssh-server \
                   nmap nmap-ncat 

# Para converte grafos em imagens (fica muito bom!).
# https://graphviz.org/download/

# Suporte para o Mouse Logtech

# Pacotes principais do TeX Live

# ferramentas para trabalhar com Latex e manipulação de imagens
sudo rpm-ostree -y install \
               graphviz ghc-graphviz \
               solaar logiops \
               texlive-scheme-full \
               texmaker texworks latexmk \
               tgif tpp

# Utilitário que flexibiliza o uso de ferramentas como o PodMan 
# mas ainda mais simples do que usar somente linha de comando (distrobox).

# Pacotes básicos para desenvolvimento C++ e Rust
sudo rpm-ostree -y install distrobox \
                   checkmake cmake-fedora cmrc-devel ignition-cmake-devel c4project llvm-cmake-utils \
                   cmake-data cmake-doc cmake-filesystem cmake-gui cmake-rpm-macros \
                   cmake-srpm-macros llvm-cmake-utils c4project cmake-fedora  cmrc-devel \
                   extra-cmake-modules cmrc-devel gcc-c++ gcc-gdb-plugin gcc-plugin-annobin \
                   gcc-plugin-devel libgccjit         libgccjit-devel                libgomp-offload-amdgcn \
                   libgomp-offload-nvptx libquadmath libquadmath-devel               rust rust-actix-web+__compress-devel \
                   rust-actix-web+__tls-devel         rust-actix-web+actix-tls-devel rust-actix-web+compat-devel \
                   rust-actix-web+compress-gzip-devel rust-actix-web+cookies-devel   rust-actix-web+default-devel \
                   rust-actix-web+http2-devel         rust-actix-web+macros-devel    rust-analyzer rust-argmax-devel rust-argon2-devel \
                   aw-server-rust bindgen-cli  cargo  cargo-insta cargo-rpm-macros cbindgen clippy rust-addr2line-devel \
                   rust-addr2line+std-devel           rust-addr2line+smallvec-devel
                   
# Silver Searcher
# Fazendo gráficos na linha de comando (gnuplot)                   
sudo rpm-ostree -y install \
                   the_silver_searcher \
                   gnuplot gnuplot-common gnuplot-minimal gnuplot-wx gnuplot-doc gnuplot-latex

# Base packages for GoLang
sudo rpm-ostree -y install \
                  golang golang-bin golang-docs golang-github-alecthomas-kong-devel \
                  golang-shared golang-misc golang-src golang-tests golangci-lint \
                  compat-golang-github-codegangsta-cli-devel compat-golang-github-coreos-clair-devel \
                  compat-golang-github-coreos-oidc-3-devel compat-golang-github-docopt-devel \
                  compat-golang-github-facebook-ent-devel godoctor glide

                   
                   
                   




