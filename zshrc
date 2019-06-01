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

export EDITOR='nvim'
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

#function kubectl() {
#    if ! type __start_kubectl >/dev/null 2>&1; then
#        source <(command kubectl completion zsh)
#    fi
#
#    command kubectl "$@"
#}

#if [ /Users/ignacio/google-cloud-sdk/bin/kubectl ]; then source <(kubectl completion zsh); fi

LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R -X -F '


#zprof


alias vi=nvim
alias vim=nvim
alias python=python3
alias vim=nvim
alias vimdiff="nvim -d"
alias cat=bat
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias help='tldr'
export KEYTIMEOUT=1

alias gostart="cd /Users/ignacio/go/src/github.com/igomez10"
alias weather="curl wttr.in"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GO111MODULE=on

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ignacio/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ignacio/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ignacio/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ignacio/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

#alias fzf="vim $(fzf -m --preview 'bat --style=numbers --color=always {}' ) -O"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export TERM=xterm-new


_python_argcomplete() {
    local IFS=$'\013'
    local SUPPRESS_SPACE=0
    if compopt +o nospace 2> /dev/null; then
        SUPPRESS_SPACE=1
    fi
    COMPREPLY=( $(IFS="$IFS" \
                  COMP_LINE="$COMP_LINE" \
                  COMP_POINT="$COMP_POINT" \
                  COMP_TYPE="$COMP_TYPE" \
                  _ARGCOMPLETE_COMP_WORDBREAKS="$COMP_WORDBREAKS" \
                  _ARGCOMPLETE=1 \
                  _ARGCOMPLETE_SUPPRESS_SPACE=$SUPPRESS_SPACE \
                  "$1" 8>&1 9>&2 1>/dev/null 2>/dev/null) )
    if [[ $? != 0 ]]; then
        unset COMPREPLY
    elif [[ $SUPPRESS_SPACE == 1 ]] && [[ "$COMPREPLY" =~ [=/:]$ ]]; then
        compopt -o nospace
    fi
}
complete -o nospace -F _python_argcomplete "az"

alias morning="open -na 'Google Chrome' --args --new-window --window-size=100,400 https://bloomberg.com \
open -na 'Google Chrome' --args --new-window --window-size=100,400 https://nytimes.com"

# nvr to open files inside neovim terminal mode
if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  alias h='nvr -o'
  alias v='nvr -O'
  alias t='nvr --remote-tab'
fi
