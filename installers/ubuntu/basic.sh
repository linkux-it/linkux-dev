# /usr/bin/env bash

source ./installers/common.sh
echo

e_header "Adding some repositories"
sudo add-apt-repository ppa:neovim-ppa/unstable -y

e_header "Updating Repositories"
sudo apt-get update

e_header "Installing tools with apt-get"
sudo apt-get install -y ack wget git git-core tmux zsh task python python-dev python-pip python3-dev python3-pip neovim libgnutls-dev
curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash

e_header "Install zprezto"

[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ] && git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

FILES="${ZDOTDIR:-$HOME}/.zprezto/runcoms/zlogin
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zlogout
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zpreztorc
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zprofile
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshenv
${ZDOTDIR:-$HOME}/.zprezto/runcoms/zshrc"
for rcfile in $FILES; do
  ln -s "$rcfile" "${rcfile:t}"
done

chsh -s /bin/zsh

# Setting up neobundle
if [ ! -d ~/.vim/bundle ]; then
  e_header "Creating bundle directory for NeoBundle"
  mkdir -p ~/.vim/bundle
fi

if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
  e_header "Cloning NeoBundle"
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
