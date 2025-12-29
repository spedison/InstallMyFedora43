#!/bin/bash

# IDEs da JetBrains

# CLion
cd ~
FILE_P=CLion-2025.3.1
wget https://download-cdn.jetbrains.com/cpp/$FILE_P.tar.gz
gunzip $FILE_P.tar.gz
cd ~/.local/share
tar -xvf ~/$FILE_P.tar
ln -s ~/.local/share/$FILE_P ~/.local/share/clion
echo 'export PATH=$PATH:/home/spedison/.local/share/clion/bin' >> ~/.bashrc
rm ~/$FILE_P.tar

#GoLand
cd ~
FILE_P=goland-2025.3
wget https://download-cdn.jetbrains.com/go/$FILE_P.tar.gz
gunzip $FILE_P.tar.gz
cd ~/.local/share
tar -xvf ~/$FILE_P.tar
ln -s ~/.local/share/$FILE_P ~/.local/share/goland
echo 'export PATH=$PATH:/home/spedison/.local/share/goland/bin' >> ~/.bashrc
rm ~/$FILE_P.tar

#IntelliJ
cd ~
export FILE_P=idea-2025.3.1
wget https://download-cdn.jetbrains.com/idea/$FILE_P.tar.gz
gunzip $FILE_P.tar.gz
cd ~/.local/share
tar -xvf ~/$FILE_P.tar
# ele me fez o favor de quebrar o Script alterando o nome do diretorio interno diferente do arquivo compactado
export FILE_PN=$(ls -1 | grep -i  "idea-iu")
ln -s $HOME/.local/share/idea-IU-253.29346.138 $HOME/.local/share/intellij
ln -s $HOME/.local/share/intellij/bin/idea  $HOME/.local/share/intellij/bin/intellij
echo 'export PATH=$PATH:$HOME/.local/share/intellij/bin' >> $HOME/.bashrc
rm ~/$FILE_P.tar

#PyCharm
cd ~
FILE_P=pycharm-2025.3.1
wget https://download-cdn.jetbrains.com/python/$FILE_P.tar.gz
gunzip $FILE_P.tar.gz
cd ~/.local/share
tar -xvf ~/$FILE_P.tar
ln -s ~/.local/share/$FILE_P ~/.local/share/pycharm
echo 'export PATH=$PATH:/home/spedison/.local/share/pycharm/bin' >> ~/.bashrc
rm ~/$FILE_P.tar

#RustRover
cd ~
FILE_P=RustRover-2025.3.1
wget https://download-cdn.jetbrains.com/rustrover/$FILE_P.tar.gz
gunzip $FILE_P.tar.gz
cd ~/.local/share
tar -xvf ~/$FILE_P.tar
ln -s ~/.local/share/$FILE_P ~/.local/share/rustrover
echo 'export PATH=$PATH:/home/spedison/.local/share/rustrover/bin' >> ~/.bashrc
rm ~/$FILE_P.tar








