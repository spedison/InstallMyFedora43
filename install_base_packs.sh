# Vim e alguns plugins
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
sudo rpm-ostree -y install ImageMagick ImageMagick-c++ ImageMagick-c++-devel vips-magick

# App que converte webp em jpg
# Exemplo : dwebp apache-Lucene.webp -o apache-Lucene.png
sudo apt install -y dwebp 

# Usando o ssh
sudo apt install -y openssh-client openssh-server

# Para que possa configurar o AppArMor.
sudo apt install -y apparmor-utils

# Para converte grafos em imagens (fica muito bom!).
# https://graphviz.org/download/
sudo apt install -y graphviz

# Suporte para o Mouse Logtech
sudo apt install -y solaar logiops

# Editor vim modo gráfico
sudo apt install -y vim-gtk3

# Aplicativos para manipulaçãp de arquivo Latex (inclusive o latex make)
sudo apt install -y texlive texlive-latex-base texlive-science texlive-publishers texlive-pictures-doc texlive-latex-extra texlive-lang-portuguese texlive-font-utils texlive-binaries 
sudo apt install -y texlive-bibtex-extra texlive-base tth tpp tgif texworks texmaker texmaker-data sent latexmk
