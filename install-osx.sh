#!/bin/bash

# First clone or update our dotfiles
if [ ! -d ~/.linkux-dev ]; then
  echo "Linkux IT :: Install: Cloning Repository"
  git clone https://github.com/linkux-it/linkux-dev.git ~/.linkux-dev
else
  echo "Linkux IT :: Update: Updating repository"
  cd ~/.linkux-dev && git pull
  cd
fi

cd ~/.linkux-dev
source ~/.linkux-dev/installers/osx/basic.sh
source ~/.linkux-dev/installers/osx/settings.sh
