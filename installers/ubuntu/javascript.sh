#!/usr/bin/env bash

source ~/.linkux-dev/installers/common.sh

e_header "Installing nodejs"
sudo apt-get install -y nodejs
sudo apt-get install -y npm

e_header "Installing nodejs, javascript tools"
npm install eslint -g
npm install babel-eslint -g
npm install eslint-plugin-react -g
npm install grunt-cli -g
npm install gulp-cli -g
npm install avn avn-nvm -g
npm install tern -g
npm install jsctags -g

avn setup

e_header "Installing NVM"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash
source ~/.nvm/nvm.sh
nvm install node

e_header "Update .zshrc"
if grep -Fxq "# start javascript setup" ~/.zshrc
then
  sed -i '/# start javascript setup/,/# end javascript setup/d' ~/.zshrc
fi

cat >> ~/.zshrc <<- EOM
# start javascript setup

# Set preference on project binaries for nodejs or iojs
export PATH=./node_modules/.bin:\$PATH
source ~/.nvm/nvm.sh

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
# end javascript setup
EOM
