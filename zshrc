# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
source "$HOME/.antigen/antigen.zsh"

antigen-apply

fpath=(~/.zsh/completion $fpath)

# Enable auto completion
autoload -Uz compinit && compinit -i

# Path to your oh-my-zsh installation.
export ZSH=/Users/levblanc/.oh-my-zsh


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="levblanc"

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
ZSH_CUSTOM=$HOME/.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Command correction
setopt correctall

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

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# setup go env variables 
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# alias system vim to newer version vim (v7.4.1147)
alias vi='/usr/local/bin/vim'
# alias vim='/usr/local/bin/vim'

#alias tmuxinator command
alias tmuxi='tmuxinator'

# hook up .agignore
alias ag='ag --path-to-agignore=~/.agignore'

# alias ngrok 
alias ngrok='/Applications/ngrok'

# alias python 
alias py='python'

# alias grafana 
alias grafana='sh ~/scripts/grafana.sh'

# alias mongod command
alias mongod='mongod --dbpath ~/mongodb'
 
# mongodb v3.4 setting
# so that you can run "mongod" directly in terminal
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"

# add IntelliJ Idea command line launcher to path
export PATH="/usr/local/bin/idea:$PATH"

# add PostgreSQL to path
export PATH="/Applications/Postgres.app/Contents/Versions/12/bin/:$PATH"

# set JAVA_HOME
export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`

# add maven to path
export PATH="/usr/local/bin/apache-maven-3.6.3/bin:$PATH"

# set GPG_TTY
GPG_TTY=$(tty)
export GPG_TTY

# add anaconda3 to path
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/levblanc/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/levblanc/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/levblanc/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/levblanc/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
