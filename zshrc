#zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

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
  zsh-autosuggestions

#  kubectl
)

source $ZSH/oh-my-zsh.sh

autoload -U promptinit; promptinit
prompt pure

export LANG=en_US.UTF-8

export EDITOR='nvim'
alias k='kubectl'
alias kg='kubectl get'
alias kgpo='kubectl get pod'




#autoload -U edit-command-line
#
autoload -U promptinit; promptinit
prompt pure


export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export KEYTIMEOUT=1
export GO111MODULE=on

export PATH=$PATH:$HOME/.cargo/bin

alias vi=nvim
alias vim=nvim
alias python=python3
alias vimdiff="nvim -d"
alias cat=bat
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'
export KEYTIMEOUT=1

alias gostart="cd $HOME/go/src/github.com/igomez10"
alias weather="curl wttr.in"

# nvr to open files inside neovim terminal mode
if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  alias h='nvr -o'
  alias v='nvr -O'
  alias t='nvr --remote-tab'
fi

# added by travis gem
[ -f /Users/ignacio/.travis/travis.sh ] && source /Users/ignacio/.travis/travis.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
