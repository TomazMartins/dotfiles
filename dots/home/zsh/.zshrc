# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/zamott/.oh-my-zsh

# ===================================================================================
#                                     PLUGINS
# ===================================================================================
plugins=(
  zsh-syntax-highlighting
  zsh-autosuggestions
  docker-compose
  git-extras
  vagrant
  docker
  ruby
  git
)


# ==============================================================================
#                                      THEMES
# ==============================================================================
ZSH_THEME="powerlevel10k/powerlevel10k"


# ============================ Custom Theme ====================================
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(newline context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator)


# ==============================================================================
#                                     PERSONAL SETTINGS
# ==============================================================================


# =============================== Colors =======================================
NONE="\033[0m" # Standard Color

K="\033[0;30m" # Black
R="\033[0;31m" # Red
G="\033[0;32m" # Green
Y="\033[0;33m" # Yellow
B="\033[0;34m" # Blue
M="\033[0;35m" # Magenta
C="\033[0;36m" # Cyan
W="\033[0;37m" # White

BK="\033[1;30m" # Bold+Black
BR="\033[1;31m" # Bold+Red
BG="\033[1;32m" # Bold+Green
BY="\033[1;33m" # Bold+Yellow
BB="\033[1;34m" # Bold+Blue
BM="\033[1;35m" # Bold+Magenta
BC="\033[1;36m" # Bold+Cyan
BW="\033[1;37m" # Bold+White

BGK="\033[40m" # Background Black
BGR="\033[41m" # Background Red
BGG="\033[42m" # Background Green
BGY="\033[43m" # Background Yellow
BGB="\033[44m" # Background Blue
BGM="\033[45m" # Background Magenta
BGC="\033[46m" # Background Cyan
BGW="\033[47m" # Background White

# ========================== Alias command =====================================
alias ls='ls --group-directories-firs --color=auto'
alias l1='ls -1 --group-directories-first'  # listing in a column
alias la='ls -a --group-directories-first'  # listing hidden files
alias l1a='ls -1a --group-directories-first'  # listing hidden files in a column
alias lr='ls -R --group-directories-first'  # listing recursive

alias ggready="git fetch --prune && ggpull"
alias gcstg="git checkout staging"
alias hc="history -c"
alias h="history"

alias vscode="code"
alias ..="cd .."


# ============================ Functions =======================================

# Handy Extract Program
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Creates an archive (*.tar.gz) from given directory
function maketar() {
  tar cvzf "${1%%/}.tar.gz"  "${1%%/}/";
}

# Create a ZIP archive of a file or folder
function makezip() {
  zip -r "${1%%/}.zip" "$1" ;
}

# Stop All Docker Containers
function stop_containers() {
  sudo docker stop $(sudo docker ps -aq)
}

# Remove All Stopped Docker Containers
function remove_containers() {
  sudo docker rm $(sudo docker ps -aq)
}

# Prune Docker Containers
function prune_containers() {
  sudo docker system prune
}

# Alias dinâmico para dcr com nome do repositório Git
# OBS: Essa função é útil no contexto da TodoIncomm
function dcrapi() {
  local repo_root
  local repo_name
  
  # Obtém o diretório raiz do repositório Git
  repo_root=$(git rev-parse --show-toplevel 2>/dev/null)
  
  if [[ -z "$repo_root" ]]; then
    echo "Erro: você não está dentro de um repositório Git." >&2
    return 1
  fi
  
  # Extrai apenas o nome do diretório raiz
  repo_name="${repo_root##*/}"
  
  # Executa o comando dcr com o nome do repositório + -api
  docker-compose run "${repo_name}-api" "$@"
}

# Get IP adress on ethernet
function my_ip()
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}


# ==============================================================================
#                                 VARIABLES AND PATH
# ==============================================================================
PATH="$GEM_HOME/bin:$HOME/.bin:$PATH"
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
