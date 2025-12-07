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
         sudo rpm-ostree -y remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
    
        echo "📝 Fase 2: Criando o repositório docker-ce.repo..."

        sudo mkdir -p /etc/yum.repos.d
        sudo bash -c " curl 'https://download.docker.com/linux/fedora/docker-ce.repo' > /etc/yum.repos.d/docker-ce.repo"

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
