# Enable auto completion
autoload -U compinit
compinit

# Auto-complete styling: Group matches and describe
zstyle ':completion:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Auto-complete styling: Directories
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# Command correction
setopt correctall

# Enable advanced prompt
autoload -U promptinit
promptinit

#Config prompt colors
autoload -U colors && colors
PROMPT="
$bg[black]$fg[yellow] %* $reset_color $fg[red]%n$reset_color at $fg[blue]%m$reset_color in $fg[green]%~
$fg[cyan]❯$fg[blue]❯$fg[magenta]❯$fg[red]❯$fg[yellow]❯$fg[green]❯ $reset_color"

# Set tab title to cwd
precmd () {
   tab_label=${PWD/${HOME}/\~} # use 'relative' path
   echo -ne "\e]2;${tab_label}\a" # set window title to full string
   echo -ne "\e]1;${tab_label: -24}\a" # set tab title to rightmost 24 characters
}

# nvm
export NVM_DIR="/Users/levblanc/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/dist

# android env variable
export ANDROID_HOME=/usr/local/opt/android-sdk

# alias system vim to newer version vim (v7.4.1147)
alias vi='/usr/local/bin/vim'
# alias vim='/usr/local/bin/vim'

# setup .vimrc file env variable
export MY_VIMRC='/Users/levblanc/.vimrc'

 #starting up vim to set the environment variable required 
# to enable true colour in Neovim
# (doesn't work quite well. Disable for now. @2016-02-01)
#
# alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
# alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

# enable pyenv shims and autocompletion
eval "$(pyenv init -)"
