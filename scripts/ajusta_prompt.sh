#!/bin/bash

# Função para mostrar o nome do branch atual do Git, se existir
parse_git_branch() {
    git branch 2>/dev/null | sed -n '/\* /s///p' | sed 's/^/(/' | sed 's/$/)/'
}

# Ativar prompt colorido
if [ "$color_prompt" = "yes" ]; then
    # Cores com tput
    RED=$(tput setaf 1; tput bold)
    YELLOW=$(tput setaf 3; tput bold)
    GREEN=$(tput setaf 2; tput bold)
    CYAN=$(tput setaf 6; tput bold)
    BLUE=$(tput setaf 4; tput bold)
    RESET=$(tput sgr0)

    # Prompt com git branch se estiver em um repo
    PS1='${GREEN}\u${YELLOW}@${CYAN}\h ${YELLOW}em ${RED}\w ${BLUE}$(parse_git_branch)${RESET}\n\$ '
else
    PS1='\u@\h:\w\$ '
fi

