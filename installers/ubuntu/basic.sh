# /usr/bin/env bash

source ./installers/common.sh
echo

e_header "Adding some repositories"
sudo add-apt-repository ppa:neovim-ppa/unstable -y

e_header "Updating Repositories"
sudo apt-get update

e_header "Installing tools with apt-get"
sudo apt-get install -y ack
sudo apt-get install -y wget
sudo apt-get install -y git 
sudo apt-get install -y git-core
sudo apt-get install -y tmux
sudo apt-get install -y zsh
sudo apt-get install -y libgnutls-dev
sudo apt-get install -y task
sudo apt-get install -y python
sudo apt-get install -y python-dev
sudo apt-get install -y python-pip
sudo apt-get install -y python3-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y neovim

curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash

e_header "Install zprezto"

[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ] && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

FILES="${ZDOTDIR:-$HOME}/.zprezto/runcoms/zlogin
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zlogout
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zprofile
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshenv
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc"
for rcfile in $FILES; do
  ln -s "${rcfile}" ~/.$(basename $rcfile)
done

sudo chsh -s $(which zsh)

# Setting up neobundle
if [ ! -d ~/.nvim/bundle ]; then
  e_header "Creating bundle directory for NeoBundle"
  mkdir -p ~/.nvim/bundle
fi

if [ ! -d ~/.nvim/bundle/neobundle.vim ]; then
  e_header "Cloning NeoBundle"
  git clone https://github.com/Shougo/neobundle.vim ~/.nvim/bundle/neobundle.vim
fi
