#!/bin/bash

set -e

# We need to ensure that brew is intalled
# install:
#  . git
#  . neovim
#  . tmux
#  . taskwarrior

if [[ "$unamestr" == 'Darwin' ]]; then
    which -s brew
    if [[ $? != 0 ]] ; then
        # Install Homebrew
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
    sudo apt-get --assume-yes install git python-dev python-pip python3-dev python3-pip neovim tmux task

    # Set alternatives
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    sudo update-alternatives --config vi
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --config vim
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    sudo update-alternatives --config editor
fi

# First clone or update our dotfiles
if [ ! -d ~/.linkuxit-dev ]; then
  git clone https://github.com/linkux-it/linkux-dev.git ~/.linkuxit-dev
else
  cd ~/.linkuxit-dev && git pull
fi

# if exists and is not symlinks
if [ -f ~/.vimrc ] && [ ! -L ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc.old
fi

# create symlinks for setups
if [ ! -f ~/.vimrc ]; then
  ln -s ~/.linkuxit-dev/vimrc ~/.vimrc
fi

# Setting up neobundle
if [ ! -d ~/.vim/bundle ]; then
  mkdir -p ~/.vim/bundle
fi

if [ ! -d "~/.vim/bundle/neobundle.vim" ]; then
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

+NeoBundleInstall +qall

# Setup configs neovim, taskwarrior, tmux
