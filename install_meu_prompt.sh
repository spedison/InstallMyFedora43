#!/bin/bash

if [[ $(grep "# Meu Prompt" $HOME/.bashrc | wc -l) -eq 1 ]]; then  
	echo "Instalação já foi feita"
	exit	
fi

(
	echo "# Meu Prompt customizado"
	echo "export color_prompt='yes'"
        echo "source $HOME/scripts/ajusta_prompt.sh"

) >> $HOME/.bashrc

mkdir $HOME/scripts
cp -v ./scripts/*.sh $HOME/scripts/.
source $HOME/.bashrc
echo "Instalação concluída"
