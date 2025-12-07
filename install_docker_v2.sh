#!/usr/bin/env bash

# Remove o 'set -e' para não parar na primeira falha
# Vamos tratar erros individualmente

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

# Função auxiliar para instalar pacotes ignorando se já existem
rpm_ostree_install_safe() {
    local package="$1"
    echo "  → Tentando instalar: $package"
    
    if rpm -q "$package" &>/dev/null; then
        echo "  ℹ️  $package já está instalado, pulando..."
        return 0
    fi
    
    if sudo rpm-ostree install -y "$package" 2>&1 | grep -q "already requested"; then
        echo "  ℹ️  $package já foi solicitado anteriormente, continuando..."
        return 0
    fi
    
    return 0
}

# Função auxiliar para remover pacotes ignorando se não existem
rpm_ostree_remove_safe() {
    local package="$1"
    echo "  → Tentando remover: $package"
    
    if ! rpm -q "$package" &>/dev/null; then
        echo "  ℹ️  $package não está instalado, pulando..."
        return 0
    fi
    
    sudo rpm-ostree remove -y "$package" 2>&1 || {
        echo "  ⚠️  Erro ao remover $package (pode não existir), continuando..."
        return 0
    }
    
    return 0
}

# Verifica se foi passado um parâmetro válido
case "$1" in
    1)
        echo "🧱 Fase 1: Instalando dnf-plugins-core via rpm-ostree..."
        rpm_ostree_install_safe "dnf-plugins-core"
        echo "✅ Fase 1 concluída. Reiniciando o sistema..."
        sleep 2
        sudo systemctl reboot
        ;;
    2)
        echo "📝 Fase 2: Removendo pacotes Docker antigos do sistema..."
        
        # Lista de pacotes a remover
        packages_to_remove=(
            "docker"
            "docker-ce"
            "docker-ce-cli"
            "docker-client"
            "docker-client-latest"
            "docker-common"
            "docker-latest"
            "docker-latest-logrotate"
            "docker-logrotate"
            "docker-selinux"
            "docker-engine-selinux"
            "docker-engine"
            "containerd.io"
        )
        
        for pkg in "${packages_to_remove[@]}"; do
            rpm_ostree_remove_safe "$pkg"
        done
        
        echo ""
        echo "📝 Criando o repositório docker-ce.repo..."
        sudo mkdir -p /etc/yum.repos.d
        
        if curl -fsSL 'https://download.docker.com/linux/fedora/docker-ce.repo' | sudo tee /etc/yum.repos.d/docker-ce.repo > /dev/null; then
            echo "  ✅ Repositório criado com sucesso"
        else
            echo "  ❌ Erro ao criar repositório, mas continuando..."
        fi
        
        echo ""
        echo "📦 Instalando Docker CE, CLI e containerd.io..."
        rpm_ostree_install_safe "docker-ce"
        rpm_ostree_install_safe "docker-ce-cli"
        rpm_ostree_install_safe "containerd.io"
        
        echo "✅ Fase 2 concluída. Reiniciando o sistema..."
        sleep 2
        sudo systemctl reboot
        ;;
    3)
        echo "🚀 Fase 3: Habilitando e iniciando o serviço Docker..."
        
        # Habilita e inicia o Docker
        if sudo systemctl enable docker 2>/dev/null; then
            echo "  ✅ Docker habilitado para iniciar no boot"
        else
            echo "  ℹ️  Docker já estava habilitado"
        fi
        
        if sudo systemctl start docker 2>/dev/null; then
            echo "  ✅ Docker iniciado com sucesso"
        else
            echo "  ℹ️  Docker já estava em execução"
        fi
        
       # Verifica se o grupo docker existe em /etc/group
        if ! grep -q "^docker:" /etc/group 2>/dev/null; then
            echo "  ℹ️  Grupo 'docker' não está em /etc/group, copiando de /usr/lib/group..."
            
            # Extrai a linha do grupo docker de /usr/lib/group
            if sudo bash -c 'grep "^docker:" /usr/lib/group >> /etc/group 2>/dev/null'; then
                echo "  ✅ Grupo 'docker' copiado com sucesso mantendo o GID original"
            #else
            #    echo "  ⚠️  Não encontrou grupo docker em /usr/lib/group, criando novo..."
            #    sudo groupadd docker || echo "  ⚠️  Erro ao criar grupo"
            fi
        else
            echo "  ℹ️  Grupo 'docker' já existe em /etc/group"
        fi
        
        # Adiciona usuário ao grupo docker
        if [ -n "$SUDO_USER" ]; then
            USERNAME="$SUDO_USER"
        else
            USERNAME="$USER"
        fi
        
        echo "  → Adicionando usuário '$USERNAME' ao grupo docker..."
        if sudo usermod -aG docker "$USERNAME"; then
            echo "  ✅ Usuário adicionado ao grupo docker"
            echo ""
            echo "⚠️  IMPORTANTE: Faça logout e login novamente (ou reinicie) para as permissões terem efeito!"
            echo "    Ou execute: newgrp docker"
        else
            echo "  ⚠️  Erro ao adicionar usuário ao grupo docker"
        fi
        
        echo ""
        echo "🔍 Verificando status do Docker..."
        sudo systemctl status docker --no-pager || true
        
        echo ""
        echo "✅ Fase 3 concluída!"
        ;;
    *)
        show_help
        ;;
esac
