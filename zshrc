source ~/.git-prompt.sh
source "$HOME/.antigen/antigen.zsh"

antigen-apply


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
setopt PROMPT_SUBST; 

export GIT_PS1_SHOWUPSTREAM='verbose'
export GIT_PS1_SHOWDIRTYSTATE=yes
export GIT_PS1_STATESEPARATOR=' | '
export GIT_PS1_SHOWUNTRACKEDFILES=yes
export GIT_PS1_HIDE_IF_PWD_IGNORED=yes

# get pyenv version name
__pyenv_version_ps1 ()
{
    local ret=$?;
    output=$(pyenv version-name);

    if [[ -n $output && $output != "system" ]]; then
        echo -n "(py@$output)"
    fi

    return $ret;
}

PS1='
$fg[magenta] %*$reset_color λ $reset_color%F{81}%~$reset_color $fg[yellow]$(__git_ps1 "[%s]")$reset_color
$fg[cyan]$(__pyenv_version_ps1)$reset_color$fg[blue] ❯$fg[cyan]❯$fg[green]❯$fg[yellow]❯$fg[red]❯$fg[magenta]❯ $reset_color'
# PROMPT=' 
# $bg[black]$fg[yellow] %* $reset_color $fg[red]%n$reset_color at $fg[blue]%m$reset_color in $fg[green]%~
# $fg[cyan]❯$fg[blue]❯$fg[magenta]❯$fg[red]❯$fg[yellow]❯$fg[green]❯ $reset_color'

# Set tab title to cwd
precmd () {
   tab_label=${PWD/${HOME}/\~} # use 'relative' path
   echo -ne "\e]2;${tab_label}\a" # set window title to full string
   echo -ne "\e]1;${tab_label: -24}\a" # set tab title to rightmost 24 characters
}

# mkdir && cd to a directory 
function take() {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

# alias php composer command to init laravel projects
function laranew() {
    composer create-project --prefer-dist laravel/laravel $1
}

# nvm
export NVM_DIR="/Users/levblanc/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# changes nvm mirror to taobao npm registry
export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node

# android env variable
export ANDROID_HOME=/usr/local/opt/android-sdk

# setup .vimrc file env variable
export MY_VIMRC='/Users/levblanc/.vimrc'

# setup env variable EDITOR
export EDITOR='vim'

# simulate prompt changing behavior of pyenv virtualenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# setup influxdb config file env variable
export INFLUXDB_CONFIG_PATH='/usr/local/etc/influxdb.conf'

# alias system vim to newer version vim (v7.4.1147)
alias vi='/usr/local/bin/vim'
# alias vim='/usr/local/bin/vim'

#alias tmuxinator command
alias tmuxi='tmuxinator'

# hook up .agignore
alias ag='ag --path-to-agignore=~/.agignore'

# alias mongod command
alias mongod='mongod --dbpath ~/mongodb'

# alias ngrok 
alias ngrok='/Applications/ngrok'

# alias proxychains 
alias png='proxychains4'

# alias python 
alias py='python'

# alias grafana 
alias grafana='sh ~/scripts/grafana.sh'

# starting up vim to set the environment variable required 
# to enable true colour in Neovim
# (doesn't work quite well. Disable for now. @2016-02-01)
#
# alias v='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
# alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

# tmuxinator completion file
source ~/.zsh_tmuxinator_completion

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

