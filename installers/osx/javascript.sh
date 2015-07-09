#!/usr/bin/env bash

source ~/.linkux-dev/installers/common.sh
e_header "Installing NVM and nodejs and iojs"
brew install nvm
source ~/.nvm/nvm.sh
nvm install iojs 
nvm install node

e_header "Installing nodejs, javascript tools"
npm install eslint -g
npm install babel-eslint -g
npm install eslint-plugin-react -g
npm install grunt-cli -g
npm install gulp-cli -g
npm install avn avn-nvm -g

avn setup

e_header "Update .zshrc"
if grep -Fxq "# start javascript setup" ~/.zshrc
then
  sed -i '' '/# start javascript setup/,/# end javascript setup/d' ~/.zshrc
fi

cat >> ~/.zshrc <<- EOM
# start javascript setup

# Set preference on project binaries for nodejs or iojs
export PATH="./node_modules/.bin:\$PATH"
source ~/.nvm/nvm.sh

# end javascript setup
EOM
