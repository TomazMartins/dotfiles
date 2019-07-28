# DotFiles

### Instalar o Ubuntu
1. Instalação mínima
2. Baixar Atualizações

### Configurar o Git localmente
1. `sudo apt install git`
2. `ssh-keygen -t rsa -b 4096 -C "EMAIL"`
3. `eval "$(ssh-agent -s)"`
4. `ssh-add ~/.ssh/id_rsa`

### Adicionar SSH Key ao GitHub
1. `sudo apt install xclip`
2. `xclip -sel clip < ~/.ssh/id_rsa.pub`
3. Criar novo registro no GitHub

### Download dotfiles
1. `mkdir ~/git`
2. `cd ~/git`
3. `git clone git@github.com:TomazMartins/dotfiles.git`

### Executar _script_
1. `chmod 777 sripts/install.sh`
2. `./scripts/install.sh`
3. Reinicie o PC