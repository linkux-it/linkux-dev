#!/usr/bin/env bash

source ~/.linkux-dev/installers/common.sh

e_header "Installing python tools"
sudo pip install flake8 pylint pep8 neovim virtualenvwrapper

e_header "Update .zshrc"
if grep -Fxq "# start python setup" ~/.zshrc
then
  sed -i '' '/# start python setup/,/# end python setup/d' ~/.zshrc
fi

cat >> ~/.zshrc <<- EOM
# start python setup

export WORKON_HOME=\$HOME/.virtualenvs
export PROJECT_HOME=\$HOME/Projects
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source /usr/local/bin/virtualenvwrapper_lazy.sh

# end python setup
EOM
