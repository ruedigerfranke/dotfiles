# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

source ~/.iterm2_shell_integration.zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="ys"
# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  docker-compose
  git
  gitfast
  iterm2
  osx
  rails
  ruby
  rvm
  vi-mode
  vscode
  wakatime
  wd
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias vimconf="vim ~/.config/nvim/init.vim"
alias zshconf="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

fpath=(/usr/local/share/zsh-completions $fpath)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add language flags for Hyper (Terminal) by Rüdiger 2017-11-27
export LANG="de_DE.UTF-8"
export LC_COLLATE="de_DE.UTF-8"
export LC_CTYPE="de_DE.UTF-8"
export LC_MESSAGES="de_DE.UTF-8"
export LC_MONETARY="de_DE.UTF-8"
export LC_NUMERIC="de_DE.UTF-8"
export LC_TIME="de_DE.UTF-8"
export LC_ALL="de_DE.UTF-8"

# Tagesaufstellung für GIT Repo
alias git-today="git --no-pager log --since=\"0:00\" --author \".*franke.*\" | grep '^\s\s\s\s' | grep -v 'git-svn' | sed 's/^[ \t]*/- /' | grep -v '^-\s$' | tail -r | pbcopy | echo \"Protokoll in die Zwischenablage kopiert\""

# Alias für PathFinder
alias fl="open -a ForkLift"

# Benutzer bin Ordner hinzügfügen
export PATH="$HOME/bin:$PATH"

# Composer zu PATH hinzugefügt
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

# Alias für Rails Bundler
alias bi="bundle install"
alias rup="bundle install && yarn install"

# Alias für MAMP PHP
alias phpmamp='/Applications/MAMP/bin/php/php7.2.1/bin/php -c "/Library/Application Support/appsolute/MAMP PRO/conf/php7.2.1.ini"'
alias pear='/Applications/MAMP/bin/php/php7.2.1/bin/pear'
alias pecl='/Applications/MAMP/bin/php/php7.2.1/bin/pecl'

# Flutter to path
export PATH="$PATH:$HOME/lib/flutter/bin"

# Firebird
# export FIREBIRD_HOME=/Library/Frameworks/Firebird.framework/Resources
# export PATH=$PATH:$FIREBIRD_HOME/bin

# Add Python User bin to path
export PATH="$PATH:/Users/rfranke/Library/Python/2.7/bin"

# export EDITOR="code --wait"
export EDITOR="vim"

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}

# define right prompt, regardless of whether the theme defined it
RPS1='$(vi_mode_prompt_info)'
RPS2=$RPS1

# iTerm Custom Badge -> Use it with \(user.gitStatus)
function iterm2_print_user_vars() {
  iterm2_set_user_var gitStatus "$(getGitStatus)"
}

function getGitStatus {
  if [[ $(git status 2> /dev/null) = "" ]] then
    echo "$(topDirWithoutSlash)"
  else
    # echo "$(getGitProjectDir)$(topDir) git:($(getGitBranch))$(isGitBranchDirty)"
    echo "$(getGitProjectDir)"
  fi
}

function getGitProjectDir {
  basename $(git rev-parse --show-toplevel 2> /dev/null ) 2> /dev/null
}

function topDir {
  if [[ $(basename $(pwd)) = $(getGitProjectDir) ]] then
   echo ""
  else
   echo "/$(basename $(pwd))"
  fi
}

function topDirWithoutSlash {
  echo "$(basename $(pwd))"
}

function getGitBranch {
  basename $(git branch 2> /dev/null | grep \* | cut -c3-) 2> /dev/null
}

function isGitBranchDirty {
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "⚡ "
}

# Add Homebrew sbin to PATH
export PATH="/usr/local/sbin:$PATH"

# Set xterm-256color-italic and add a fix for ssh
export TERM=xterm-256color-italic
alias ssh="TERM=xterm-256color ssh"

# Configuration for zsh-autosuggestions
# bindkey '^\n' autosuggest-execute
# bindkey '^[OM' autosuggest-execute

# # Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

# # Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
#
# Configuration for bat (https://github.com/sharkdp/bat)
# export BAT_PAGER="less -RF"

# Set variable vor vagrant home
export VAGRANT_HOME="/Volumes/Rüds SSD1/vagrant_home"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
