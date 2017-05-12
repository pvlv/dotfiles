# Set up the prompt

autoload -Uz promptinit
promptinit

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

###########
### http://habrahabr.ru/post/162339/
### http://eax.me/zsh/
###########

#  History
# хранить историю в указанном файле
export HISTFILE=~/.zsh_history
# максимальное число команд, хранимых в сеансе
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
# включить историю команд
setopt APPEND_HISTORY
# убрать повторяющиеся команды, пустые строки и пр.
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

#Они позволяют выбирать предлагаемые zsh варианты автодополнения c помощью стрелочек
setopt menucomplete
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# Не нужно всегда вводить cd
setopt autocd

# Распаковка архивов
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.tar.xz)  tar xvfJ $1   ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *)         echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# zplug
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", on:mafredri/zsh-async
zplug "felixr/docker-zsh-completion"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
      echo; zplug install
  fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

## ALIAS
alias clr='clear'
alias zshc='subl ~/.zshrc'
alias rzshc='source ~/.zshrc'
alias nvimc='vim ~/.config/nvim/init.vim'
alias -s {html,htm}=google-chrome

# for git
alias gst='git status'
alias gbr='git branch'
alias gco='git checkout'
alias gcm='git commit -m'
alias gme='git merge'

## Utils
function base_in() {
  docker run --rm -it \
    --name base_in \
    -v $PWD:/app \
    -v $$HOME/.node6-cache:/root/.npm \
    -v $HOME/Modules:/modules \
    -p 9999:5555 \
    -w /app \
    node:6.5 \
    bash
}

base_exec_in() {
  docker exec -it base_in bash
}

function base_node_frontend() {
  docker run --rm -it \
    --name base_node_frontend \
    --user docker \
    -p 9999:5555 \
    -v $PWD:/app \
    -v $HOME/.node6-cache:/root/.npm \
    -v $HOME/Projects/common_modules:/common_modules \
    -w /app \
    pvlv/node-frontend:6.5 \
    bash
}

base_node_frontend_exec_root_in() {
    docker exec -it \
    --user root \
    base_node_frontend \
    bash
}

fix_screen() {
    xrandr --output VGA-0 --off
}

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin