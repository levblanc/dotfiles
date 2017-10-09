MAGENTA="%{$fg[magenta]%}"
BLUE="%{$fg[blue]%}"
LIGHT_BLUE="%{%F{81}%}"
CYAN="%{$fg[cyan]%}"
GREEN="%{$fg[green]%}"
YELLOW="%{$fg[yellow]%}"
RED="%{$fg[red]%}"

TIME="%{$MAGENTA%*%}"
ARROWS="%{$BLUE❯$CYAN❯$GREEN❯$YELLOW❯$RED❯$MAGENTA❯%}"
RESET="%{$reset_color%}"

# get pyenv version name
pyenv_version()
{
    local ret=$?;
    output=$(pyenv version-name);

    if [[ -n $output && $output != "system" ]]; then
        echo -n "(py@$output)"
    fi

    return $ret;
}

PYENV="%{$CYAN$(pyenv_version)%}"

PROMPT='$TIME$RESET λ $RESET$LIGHT_BLUE%~$RESET $YELLOW$(git_prompt_info) $RESET 
$PYENV$RESET $ARROWS $RESET'

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="$YELLOW]"
ZSH_THEME_GIT_PROMPT_DIRTY=" $RED✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" $GREEN✔"

