#!/bin/bash

set -e

# We need to ensure that brew is intalled
# install:
#  . git
#  . neovim
#  . tmux
#  . taskwarrior

echo "****************************************************************"
echo "*                         Linkux IT                            *"
echo "*                         =========                            *"
echo "*                                                              *"
echo "*                    Starting installation                     *"
echo "****************************************************************"
echo

echo "Neo Installer only can install for OSX and Ubuntu - Sorry :("
read -p "Do you want to use neovim?" useNeoVim
echo

echo $useNeoVim

exit 1

if [[ "$unamestr" == 'Darwin' ]]; then
    which -s brew
    if [[ $? != 0 ]] ; then
        # Linkux IT :: Install Homebrew
        # https://github.com/mxcl/homebrew/wiki/installation
        /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"
    else
        brew update
    fi

    # install neovim
    which -s nvim
    if [[ $? != 0 ]] ; then
        brew tap neovim/homebrew-neovim
        brew install --HEAD neovim
    else
        brew reinstall --HEAD neovim
    fi

    which -s git || brew install git
    which -s tmux || brew install tmux
    which -s task || brew install task
else
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get --assume-yes install git git-core python-dev python-pip python3-dev python3-pip neovim tmux task
fi

# First clone or update our dotfiles
if [ ! -d ~/.linkux-dev ]; then
  echo "Linkux IT :: Install: Cloning Repository"
  git clone https://github.com/linkux-it/linkux-dev.git ~/.linkux-dev
else
  echo "Linkux IT :: Update: Updating repository"
  cd ~/.linkux-dev && git pull
  cd
fi

# if exists and is not symlinks
if [ -f ~/.vimrc ] && [ ! -L ~/.vimrc ]; then
  echo "Linkux IT :: Install: Backup old ~/.vimrc to ~/.vimrc.old"
  mv ~/.vimrc ~/.vimrc.old
fi

# create symlinks for setups
if [ ! -f ~/.vimrc ]; then
  echo "Linkux IT :: Install: Linking Linkut IT config for vim and nvim"
  ln -s ~/.linkux-dev/vimrc ~/.vimrc
  ln -s ~/.linkux-dev/vimrc ~/.nvimrc
  ln -s .vim .nvim
fi

# Setting up neobundle
if [ ! -d ~/.vim/bundle ]; then
  echo "Linkux IT :: Install: Creating bundle directory for NeoBundle"
  mkdir -p ~/.vim/bundle
fi

if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
echo "Linkux IT :: Install:Cloning NeoBundle"
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

echo "Linkux IT :: Install vim plugins"
nvim +NeoBundleInstall +qall

# Setup configs neovim, taskwarrior, tmux
