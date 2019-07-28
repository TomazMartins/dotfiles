# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/zamott/.oh-my-zsh

# ===================================================================================
#                                     PLUGINS
# ===================================================================================
plugins=(
  zsh-syntax-highlighting
  git-extras
  vagrant
  docker
  ruby
  git
)


# ===================================================================================
#                                      THEMES
# ===================================================================================
ZSH_THEME="powerlevel9k/powerlevel9k"


# ============================ Custom Theme =============================
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(newline context dir rvm nvm vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator history time)


# ===================================================================================
#                                     PERSONAL SETTINGS
# ===================================================================================


# =============================== Colors ===============================
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

# ========================== Alias command ====================================
alias ls='ls --group-directories-firs --color=auto'
alias l1='ls -1 --group-directories-first'  # listing in a column
alias la='ls -a --group-directories-first'  # listing hidden files
alias l1a='ls -1a --group-directories-first'  # listing hidden files in a column
alias lr='ls -R --group-directories-first'  # listing recursive

alias h="history"
alias hc="history -c"
alias ..="cd .."
alias vscode="code"

# ============================ Functions ======================================

# Handy Extract Program
function extract()
{
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
function maketar()
{
  tar cvzf "${1%%/}.tar.gz"  "${1%%/}/";
}

# Create a ZIP archive of a file or folder
function makezip()
{
  zip -r "${1%%/}.zip" "$1" ;
}


# ===================================================================================
#                                 VARIABLES AND PATH
# ===================================================================================
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting

source $ZSH/oh-my-zsh.sh
