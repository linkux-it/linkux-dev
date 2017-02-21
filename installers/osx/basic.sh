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
brew tap universal-ctags/universal-ctags
brew tap neovim/neovim
brew install --HEAD universal-ctags
brew install --HEAD neovim
brew install ack
brew install wget
brew install git
brew install reattach-to-user-namespace
brew install tmux
brew install zsh
brew install gnutls
brew install task
brew install python
brew install fortune
brew install cowsay
brew install coreutils
brew install rmtrash


e_header "Installing tools with pip"
pip install bugwarrior
pip install powerline-status
pip install taskwarrior-time-tracking-hook

e_header "Setup taskwarrior"
mkdir -p ~/.task/hooks
mkdir -p ~/.config/bugwarrior
touch ~/.config/bugwarrior/bugwarriorrc
ln -s `which taskwarrior_time_tracking_hook` ~/.task/hooks/on-modify.timetracking

e_header "Install powerline fonts"
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O PowerlineSymbols.otf
sudo mv PowerlineSymbols.otf /Library/Fonts/

e_header "Install Zim"

git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim

for template_file in ${ZDOTDIR:-${HOME}}/.zim/templates/* 
do
  user_file=${ZDOTDIR:-${HOME}}/.$(basename "${template_file}")
  touch $user_file
  cat ${template_file} >> ${user_file} 2>/dev/null
done

chsh -s /bin/zsh
