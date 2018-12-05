# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/igomez/.oh-my-zsh"

ZSH_THEME=""

COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  zsh-syntax-highlighting
  zsh-completions
  kubectl
  osx
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

alias k='kubectl'
alias kg='kubectl get'
alias kgpo='kubectl get pod'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#autoload -U edit-command-line
#
autoload -U promptinit; promptinit
prompt pure


export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH="/usr/local/opt/libxml2/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/igomez/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/igomez/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/igomez/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/igomez/google-cloud-sdk/completion.zsh.inc'; fi

if [ $commands[helm] ]; then
  source <(helm completion zsh)
fi

if [ /Users/igomez/google-cloud-sdk/bin/kubectl ]; then source <(kubectl completion zsh); fi

LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R -X -F '



