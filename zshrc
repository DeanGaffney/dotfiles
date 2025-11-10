export PATH=/usr/local/bin:$HOME/bin:$PATH
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  jsontools
  node 
)

source $ZSH/oh-my-zsh.sh


export PATH="~/.local/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=false
 
# commands to override pip restriction above.
# use `gpip` or `gpip3` to force installation of
# a package in the global python environment
# Never do this! It is just an escape hatch.
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
gpip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

# Created by `userpath` on 2019-12-20 13:07:24
export PATH="$PATH:$HOME/.local/bin"

# go
export PATH="$PATH:$HOME/go/bin"

# java
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# notes
export NOTES="$HOME/notes"

# default editor
export VISUAL="nvim"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

PROMPT='%{$fg[cyan]%}%d%{$reset_color%} $(git_prompt_info)'

export LC_ALL=en_US.UTF-8

[ -d ~/.config/work ] && for f in ~/.config/work/*; do source $f; done

set -o vi

alias syncnotes="cd $NOTES && gaa && git commit -m 'chore: backup' && git push"

# functions
function fw() {
  cd $(find ~/workspace/work -type d -print -maxdepth 1 | fzf)
}

function vfw() {
  cd $(find ~/workspace/work -type d -print -maxdepth 1 | fzf) && nvim
}

function fp() {
  cd $(find ~/workspace/personal -type d -print -maxdepth 1 | fzf)
}

function vfp() {
  cd $(find ~/workspace/personal -type d -print -maxdepth 1 | fzf) && nvim
}

# Source the devops-cli configuration file
[ -f "$HOME/.devopsclirc" ] && source $HOME/.devopsclirc

# AWS CLI v2 configuration
export PATH="/usr/local/bin:$PATH"

[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select
