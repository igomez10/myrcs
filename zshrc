# Path to your oh-my-zsh installation.
ZSH_DISABLE_COMPFIX=true
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

COMPLETION_WAITING_DOTS="true"


DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_UPDATE_PROMPT=true
plugins=(
  zsh-syntax-highlighting
  zsh-completions
  zsh-autosuggestions
  docker
#  kubectl
)

export EDITOR='nvim'
alias k='kubectl'
alias kg='kubectl get'
alias kgpo='kubectl get pod'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export KEYTIMEOUT=1
export GO111MODULE=on

export PATH=$PATH:$HOME/.cargo/bin

alias vi=nvim
alias vim=nvim
#alias vim=/usr/bin/vim.basic
alias python=python3
alias vimdiff="nvim -d"
alias cat=bat
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu  --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'
alias gostart="cd $HOME/go/src/github.com/igomez10"
alias weather="curl wttr.in"

# nvr to open files inside neovim terminal mode
if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  alias h='nvr -o'
  alias v='nvr -O'
  alias t='nvr --remote-tab'
fi
#
# added by travis gem
[ -f "$HOME/.travis/travis.sh" ] && source $HOME/.travis/travis.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim

fpath+=('$PWD/functions')
fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')
autoload -U promptinit; promptinit
prompt pure


alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

#reuse docker host as docker for k8s
#eval $(minikube docker-env)
alias git-root='cd $(git rev-parse --show-cdup)'

source $HOME/.local/bin/aws_zsh_completer.sh
source <(kubectl completion zsh)
fpath=($fpath ~/.zsh/completion)

alias ping=prettyping

autoload -U compinit
compinit

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
alias tf=terraform
