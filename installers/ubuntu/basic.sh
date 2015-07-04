# /usr/bin/env bash

source ./installers/common.sh
echo

e_header "Adding some repositories"
sudo add-apt-repository ppa:neovim-ppa/unstable -y

e_header "Updating Repositories"
apt-get update

e_header "Installing tools with apt-get"
sudo apt-get install -y ack wget git git-core tmux zsh task python python-dev python-pip python3-dev python3-pip neovim libgnutls-dev
`curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash`

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

e_header "Install base16 themes"
[ ! -d "~/.config/base16-shell" ] && git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

e_header "Update .zshrc for base 16"
if grep -Fxq "# start bas16 setup" ~/.zshrc
then
  sed -i '/# start bas16 setup/,/# end python setup/d' ~/.zshrc
fi

cat >> ~/.zshrc <<- EOM
# start bas16 setup

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# end bas16 setup
EOM

# Setting up neobundle
if [ ! -d ~/.vim/bundle ]; then
  e_header "Creating bundle directory for NeoBundle"
  mkdir -p ~/.vim/bundle
fi

if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
  e_header "Cloning NeoBundle"
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
