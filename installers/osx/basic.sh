# /usr/bin/env bash

source ./installers/common.sh
echo

# Install Homebrew.
if [[ ! "$(type -P brew)" ]]; then
  e_header "Installing Homebrew"
  echo
  true | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Exit if, for some reason, Homebrew is not installed.
[[ ! "$(type -P brew)"  ]] && e_error "Homebrew failed to install." && return 1

e_header "Updating Homebrew"
brew doctor
brew update

e_header "Installing tools with brew"
brew install ack
brew install wget
brew install git
brew install reattach-to-user-namespace
brew install tmux
brew install zsh
brew install neovim --HEAD
brew install gnutls
brew install task
brew install python
brew install ctags-exuberant
brew install fortune
brew install cowsay
brew install coreutils
brew install rmtrash


e_header "Install powerline"
pip install powerline-status
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O PowerlineSymbols.otf
sudo mv PowerlineSymbols.otf /Library/Fonts/

e_header "Install Zim"

git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim

setopt EXTENDED_GLOB
for template_file in ${ZDOTDIR:-${HOME}}/.zim/templates/* 
do
  user_file = ${ZDOTDIR:-${HOME}}/.${template_file:t}
  touch ${user_file}
  ( print -rn "$(<${template_file})$(<${user_file})" >! ${user_file} ) 2>/dev/null
done

chsh -s /bin/zsh

# Setting up neobundle
if [ ! -d ~/.config/nvim ]; then
  e_header "Creating config directory for Neovim"
  mkdir -p ~/.config/nvim
fi

# Setting up Dein
if [ ! -d ~/.config/nvim/bundle ]; then
  e_header "Creating bundle directory for Dein"
  mkdir -p ~/.config/nvim/bundle
fi

if [ ! -d ~/.config/nvim/bundle/neobundle.vim ]; then
  e_header "Cloning Dein"
  git clone https://github.com/Shougo/dein.vim.git ~/.config/nvim/bundle/dein.vim
fi
