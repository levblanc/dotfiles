# enable shims and autocompletion
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
# enable auto activate/deactivate virtualenvs on entering/leaving directories 
# which contain a .python-version file
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
