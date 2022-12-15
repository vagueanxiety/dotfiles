# Path to your oh-my-zsh installation.
# https://github.com/ohmyzsh/ohmyzsh/wiki/Settings#zsh
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="lambda"
# solve airline issue inside tmux
plugins=(
git
zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

export TERM=xterm-256color
alias nvconfig="(cd ~/.config/nvim/ && nvim init.lua)"
alias zshconfig="nvim ~/.zshrc"
alias tmuxconfig='nvim ~/.tmux.conf'
alias rm="rm -i"

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d \
    -print 2> /dev/null | fzf +m) &&
    cd "$dir"
}

fvi() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune -o \
    -print 2> /dev/null | fzf +m) &&
    nvim "$dir"
}

if [[ "$(command -v nvim)" ]]; then
    export EDITOR='nvim'
    export MANPAGER='nvim +Man!'
    export MANWIDTH=999
fi

[ -f "~/.ghcup/env" ] && source "~/.ghcup/env" # ghcup-env
