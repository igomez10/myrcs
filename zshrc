#zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ignacio/.oh-my-zsh"

ZSH_THEME=""

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_UPDATE_PROMPT=true
plugins=(
  zsh-syntax-highlighting
  zsh-completions
#  kubectl
  osx
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

export LANG=en_US.UTF-8

export EDITOR='vim'
alias k='kubectl'
alias kg='kubectl get'
alias kgpo='kubectl get pod'


#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


#autoload -U edit-command-line
#
autoload -U promptinit; promptinit
prompt pure


export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH="/usr/local/opt/libxml2/bin:$PATH"

if [ $commands[helm] ]; then
  source <(helm completion zsh)
fi

function kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi

    command kubectl "$@"
}

#if [ /Users/ignacio/google-cloud-sdk/bin/kubectl ]; then source <(kubectl completion zsh); fi

LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R -X -F '


#zprof

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ignacio/Downloads/google-cloud-sdk 2/path.zsh.inc' ]; then . '/Users/ignacio/Downloads/google-cloud-sdk 2/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ignacio/Downloads/google-cloud-sdk 2/completion.zsh.inc' ]; then . '/Users/ignacio/Downloads/google-cloud-sdk 2/completion.zsh.inc'; fi


alias vi="/usr/local/bin/vim"
alias vim="/usr/local/bin/vim"
alias python=python3
alias vim=nvim
alias vimdiff="nvim -d"
export KEYTIMEOUT=1

alias gostart="cd /Users/ignacio/go/src/github.com/igomez10"
alias weather="curl wttr.in"

