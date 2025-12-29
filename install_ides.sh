# # Aplicativos mais básicos
# sudo apt install -y mc git curl wget htop btop vim terminator gnuplot octave net-tools 
# sudo apt install -y binutils make cmake gcc g++ g++-12 g++-11 libstdc++5
# sudo apt install -y zip unzip gzip libreoffice tree silversearcher-ag


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


#Anaconda
cd ~
export INSTALLER_VERSION="2024.06-1"
# Pacotes necessários
# Original 
# sudo apt install -y libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
# Ajustado
sudo apt install -y libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 liboss4-salsa-asound2 libxi6 libxtst

#        https://repo.anaconda.com/archive/Anaconda3-2024.06-1-Linux-x86_64.sh
curl -O https://repo.anaconda.com/archive/Anaconda3-$INSTALLER_VERSION-Linux-x86_64.sh

# Não tem uma instalação decente.
# Deve aceiter os termos e pedir para alterar o .bashrc
bash "$HOME/Anaconda3-$INSTALLER_VERSION-Linux-x86_64.sh"

# Depois de instalar acertar a versão da glibc
conda install -c conda-forge gcc=12.1.0









