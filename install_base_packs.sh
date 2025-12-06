# Vim e alguns plugins e sua versão Gráfica GTK
sudo rpm-ostree -y install  \
vim-gtk-syntax vim-gv vim-default-editor vim-enhanced \
awesome-vim-colorschemes perl-Text-VimColor vim-go \
vim-latex vim-X11 vim-minimal

# Mapear a rede com serviços e IPs
# Exemplo : sudo nmap -sS 192.xx.xx.0/24

# App para comparação de diretórios e arquivos 
# em uma interface gráfica amigável.

# https://github.com/jordansissel/xdotool/
# Automação de Janela, Telcado e Mouse.

# Aplicativo para listar mover janelas. 
# https://linuxvox.com/blog/what-are-the-alternatives-to-wmctrl/#comparison-table-choosing-the-right-tool
# 
sudo rpm-ostree -y install  nmap meld wtype swaymsg wlrctl


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
sudo rpm-ostree -y install urlwatch net-tools openssh-client openssh-server

# Para converte grafos em imagens (fica muito bom!).
# https://graphviz.org/download/
sudo rpm-ostree -y install graphviz ghc-graphviz 

# Suporte para o Mouse Logtech
sudo rpm-ostree -y install solaar logiops

# Pacotes principais do TeX Live
sudo rpm-ostree -y install texlive-scheme-full

# IDEs e ferramentas auxiliares
sudo rpm-ostree -y install texmaker texworks latexmk

# Outros utilitários aproximados dos que você mencionou
sudo rpm-ostree -y install tgif tpp




