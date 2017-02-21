# /usr/bin/env bash

source ./installers/common.sh
echo

e_header "Adding some repositories"
sudo add-apt-repository ppa:neovim-ppa/unstable -y

e_header "Updating Repositories"
sudo apt-get update

e_header "Installing tools with apt-get"
sudo apt-get install -y ack-grep
sudo apt-get install -y wget
sudo apt-get install -y tmux
sudo apt-get install -y zsh
sudo apt-get install -y libgnutls-dev
sudo apt-get install -y task
sudo apt-get install -y python
sudo apt-get install -y python-dev
sudo apt-get install -y python-pip
sudo apt-get install -y python3-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y neovim
sudo apt-get install -y exuberant-ctags
sudo apt-get install -y universal-ctags
sudo apt-get install -y fortune
sudo apt-get install -y cowsay
sudo apt-get install -y trash-cli


e_header "Installing tools with pip"
sudo pip install bugwarrior
sudo pip install powerline-status
sudo pip install taskwarrior-time-tracking-hook

e_header "Setup taskwarrior"
mkdir -p ~/.task/hooks
mkdir -p ~/.config/bugwarrior
touch ~/.config/bugwarrior/bugwarriorrc
ln -s `which taskwarrior_time_tracking_hook` ~/.task/hooks/on-modify.timetracking

e_header "Install powerline fonts"
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
sudo fc-cache -vf

e_header "Install Zim"

git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim

for template_file in ${ZDOTDIR:-${HOME}}/.zim/templates/* 
do
  user_file=${ZDOTDIR:-${HOME}}/.$(basename "${template_file}")
  touch $user_file
  cat ${template_file} >> ${user_file} 2>/dev/null
done

sudo chsh -s $(which zsh)
