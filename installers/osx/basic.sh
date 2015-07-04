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
  sed -i '' '/# start bas16 setup/,/# end python setup/d' ~/.zshrc
fi

cat >> ~/.zshrc <<- EOM
# start bas16 setup

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# end bas16 setup
EOM
