#!/usr/bin/env bash

source ~/.linkux-dev/installers/common.sh
e_header "Installing nodejs"
brew install node
brew install npm

e_header "Installing nodejs, javascript tools"
npm install eslint -g
npm install babel-eslint -g
npm install eslint-plugin-react -g
npm install grunt-cli -g
npm install gulp-cli -g
npm install avn avn-nvm -g
npm install tern -g
npm install tern-react -g
npm install tern-node-express -g

avn setup

e_header "Installing NVM plugin for zsh"
git clone https://github.com/lukechilds/zsh-nvm.git ~/.zsh-nvm
source ~/.zsh-nvm/zsh-nvm.plugin.zsh
nvm install node

e_header "Update .zshrc"
if grep -Fxq "# start javascript setup" ~/.zshrc
then
  sed -i '' '/# start javascript setup/,/# end javascript setup/d' ~/.zshrc
fi

cat >> ~/.zshrc <<- EOM
# start javascript setup

# Set preference on project binaries for nodejs or iojs
export PATH="./node_modules/.bin:\$PATH"
source ~/.zsh-nvm/zsh-nvm.plugin.zsh

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
# end javascript setup
EOM
