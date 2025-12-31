# InstallMyFedora43
How to install Fedora in simple computer with rtx - Scripts for configuration

URL : https://fedoraproject.org

Versão usada : 43 - Silver Blue.

Versão imutável com btrs.
### Vantagens :
   * Versão usada para manter mais estável possível
   * Núcleo do sistema muda somente o necessário
   * Instalação de programas externos não devem "sujar" o núcleo
   * Usar um versionamento de estado para a instalação
   * Usar Flatpack para apps
   * Fácil de manter
### Desvantagens :
   * Tecnologias novas, novos aprendedizados
   * Instinção do dnf, mas é possível instalá-lo e usar para consultas
   * Usa mais o disco, por conta do versionamento

Iniciei fazendo um documento do word, para instalação dos pacotes do OpenCV, vou amadurecer a ideia e
passar os scripts do Ubuntu para ele.

### TaskList
  - [X] Instalar em uma VM No Ubuntu
  - [X] Instalar no Notebook com RTX-2070
  - [ ] Como fixar o IP e/ou usar o roteador
  - [X] Mudar o nome do Host
  - [ ] Fazer scripts para ajustar o Firewall de aplicações e testar
  - [ ] Fazer scripts para ajustar o Firewall de rede e testar
  - Fazer o porte dos Scripts do Ubuntu (apt) para o Fedora SilverBlue 43     
    - [X] Fazer o porte dos Scripts do Ubuntu (snap para flatpack) para o Fedora SilverBlue 43
    - [X] Fazer e atualizar os Scripts para instalar as IDEs da JetBrains e VSCode
    - [X] Instalação do Java e linguagens com JVM
    - [X] Instalação do GoLang
    - [X] Instalação do Rust
    - [X] Instalação do ScrenCopy (ScrCpy) e fazer um Schema que não polua o fedora
    - [X] Instalação do Prompt Customizado
    - [X] Instalação e configuação do LibVirt
    - [X] Entendimento de como instalar Apps usando Containeres
    - [ ] Compatibilizar as teclas de Atalho com as anteriores
    - [ ] Montar um visual agradável com o Plugins do Gnome e exportar a instalação e configuração
    - [X] Ambiente para programação usando o OpenCV usando Ubuntu e Fedora. 
    - [X] Trocar o Docker pelo Podman
  
## Referências:
1) https://fedoraproject.org
2) https://dnf.readthedocs.io/en/latest/conf_ref.html#countme-label
3) https://docs.fedoraproject.org/pt_BR/quick-docs/adding-or-removing-software-repositories-in-fedora/
4) https://docs.fedoraproject.org/en-US/fedora-silverblue/reading-and-resources/
5) https://docs.fedoraproject.org/en-US/fedora-silverblue/_attachments/team-silverblue-origins.pdf
6) https://docs.fedoraproject.org/en-US/fedora-silverblue/_attachments/silverblue-cheatsheet.pdf
7) https://docs.fedoraproject.org/en-US/fedora-silverblue/_attachments/flatpak-print-cheatsheet.pdf
8) https://opencv.org/releases/
9) https://docs.podman.io/en/latest/markdown/podman.1.html
10) https://libpod.readthedocs.io/en/latest/Tutorials.html
11) https://man.uex.se/1/podman-remote
12) https://github.com/containers/podman/blob/main/docs/tutorials/remote_client.md?plain=1
13) https://willhbr.net/archive/
14) https://www.edivaldobrito.com.br/gerencie-suas-extensoes-do-gnome-via-linha-de-comando-de-forma-simples/
15) https://extensions.gnome.org/extension/7065/tiling-shell/

## Datas:
  * 31/12/2025 - Versão quase pronta para passar para o meu desktop de produção (por enquanto, somente na Vm e no Note)
  * 20/11/25 - Criação do repositório
