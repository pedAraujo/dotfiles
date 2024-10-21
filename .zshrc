# ENVIROMENT VARIABLES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set -o vi

export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/mysql-client/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql-client/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/mysql-client/lib/pkgconfig"

export DEV="$HOME/Dev"
export GITUSER="pedAraujo"
export GHREPOS="$DEV/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"

export EDITOR="nvim"

# OH-MY-ZSH CONFIG ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Use case-sensitive completion.
# CASE_SENSITIVE="false"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

function precmd () {
  window_title="\033]0;${PWD}\007"
  echo -ne "$window_title"
}

# Enable command auto-correction.
# ENABLE_CORRECTION="true"

# oh-my-zsh plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git zsh-autosuggestions zsh-syntax-highlighting git-prompt tmux)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh


# ALIASES ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# For a full list of active aliases, run `alias`.
# configs
alias zshconf="vim ~/.zshrc"
alias ohmyzsh="cd ~/.oh-my-zsh"
alias vimconf="cd ~/.config/nvim/"
alias tmuxconf="vim ~/.tmux.conf"
alias config="cd ~/.config"

# dirs
alias dot="cd $DOTFILES"
alias dev="cd $DEV"
alias repos="cd $GHREPOS"
alias docs="cd ~/Documents"
alias desktop="cd ~/Desktop"
alias brain="vim ~/Documents/Braindump"

# git
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gs="git status"

# python
alias python="python3"
alias pip="pip3"
alias pyenv="python -m venv .venv && source .venv/bin/activate"

# utilities
alias activate="source .venv/bin/activate"
alias cat="bat"
alias vim="nvim"
alias cl="clear"

# fzf
alias fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"

# FZF CONFIG ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
eval "$(fzf --zsh)"


# OVERWRITE DEFAULT TERMINAL PROMPT TITLE:
PS1="%1~ ❯ "

# Definindo as cores
autoload -U colors && colors

# SET VIRTUAL ENVIRONMENT COLOR
VENV_COLOR="%F{green}"

# FUNCTION TO SET PROMPT ACCORDING TO VIRTUAL ENVIRONMENT
set_prompt() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    VENV_PROMPT="${VENV_COLOR}($(basename $VIRTUAL_ENV))%f "
  else
    VENV_PROMPT=""
  fi
  PROMPT="${VENV_PROMPT}%1~ ❯ "
}
precmd_functions+=(set_prompt)


