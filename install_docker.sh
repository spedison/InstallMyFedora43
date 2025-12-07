#!/usr/bin/env bash

set -e

# Função de ajuda
show_help() {
    echo "Uso: $0 [FASE]"
    echo ""
    echo "Fases disponíveis:"
    echo "  1   Instala o dnf-plugins-core via rpm-ostree e reinicia a máquina"
    echo "  2   Cria o repositório docker-ce.repo, instala docker-ce, docker-ce-cli e containerd.io, e reinicia a máquina"
    echo "  3   Habilita e inicia o serviço Docker (systemd)"
    echo ""
    echo "Exemplo:"
    echo "  sudo $0 1"
    echo ""
    exit 1
}

# Verifica se foi passado um parâmetro válido
case "$1" in
    1)
        echo "🧱 Fase 1: Instalando dnf-plugins-core via rpm-ostree..."
        sudo rpm-ostree -y install dnf-plugins-core
        echo "✅ Fase 1 concluída. Reiniciando o sistema..."
        sudo systemctl reboot
        ;;
    2)
        echo "📝 Fase 2: Criando o repositório docker-ce.repo..."

        sudo mkdir -p /etc/yum.repos.d
        sudo cat <<EOF > /etc/yum.repos.d/docker-ce.repo
[docker-ce-stable]
name=Docker CE Stable - \$basearch
baseurl=https://download.docker.com/linux/fedora/\$releasever/\$basearch/stable
enabled=1
gpgcheck=1
gpgkey=https://download.docker.com/linux/fedora/gpg
EOF

        echo "📦 Instalando Docker CE, CLI e containerd.io..."
        sudo rpm-ostree -y install docker-ce docker-ce-cli containerd.io

        echo "✅ Fase 2 concluída. Reiniciando o sistema..."
        sudo systemctl reboot
        ;;
    3)
        echo "🚀 Fase 3: Habilitando e iniciando o serviço Docker..."

        sudo systemctl enable --now docker
        echo "✅ Docker iniciado com sucesso."

        echo "🔐 Adicionando o usuário atual ao grupo docker..."
        sudo usermod -aG docker "$USER"

        echo "ℹ️ Saia e entre novamente na sessão ou use 'newgrp docker' para ativar o grupo."
        newgrp docker
        ;;
    *)
        show_help
        ;;
esac
