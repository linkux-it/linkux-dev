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


e_header "Install powerline"
pip install powerline-status
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O PowerlineSymbols.otf
sudo mv PowerlineSymbols.otf /Library/Fonts/

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
