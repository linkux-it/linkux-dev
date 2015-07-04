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
brew install nvm
brew install neovim --HEAD
brew install gnutls
brew install task
brew install python

# Setting up neobundle
if [ ! -d ~/.nvim/bundle ]; then
  e_header "Creating bundle directory for NeoBundle"
  mkdir -p ~/.nvim/bundle
fi

if [ ! -d ~/.nvim/bundle/neobundle.vim ]; then
  e_header "Cloning NeoBundle"
  git clone https://github.com/Shougo/neobundle.vim ~/.nvim/bundle/neobundle.vim
fi
