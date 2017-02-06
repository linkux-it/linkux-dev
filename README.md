# Basic development environment

This repository has the config files also the install scripts
to automate all process for setting up an usable environment.

Scripts only for osx and for ubuntu (debian)

This environment is used by Linkux IT for all computers in our 
offices.

Based on this dotfiles:
=======================

  - https://github.com/aaronjensen/dotfiles
  - https://github.com/jackfranklin/dotfiles
  - https://github.com/bling/dotvim
  - https://github.com/nicknisi/dotfiles
  - https://github.com/cowboy/dotfiles

Install on Ubuntu:
=================

```bash
curl -s https://raw.githubusercontent.com/linkux-it/linkux-dev/master/install-ubuntu.sh | bash
# if you need python tools
bash ~/.linkux-dev/installers/ubuntu/python.sh
# if you need javascript tools
bash ~/.linkux-dev/installers/ubuntu/javascript.sh
```

Install on OSX:
=================

```bash
curl -s https://raw.githubusercontent.com/linkux-it/linkux-dev/master/install-osx.sh | bash
# if you need python tools
bash ~/.linkux-dev/installers/osx/python.sh
# if you need javascript tools
bash ~/.linkux-dev/installers/osx/javascript.sh
```

Main Installers install:
=======================

Installers: 

*install-ubuntu.sh*
*install-osx.sh*

* git
* neovim
* tmux
* ack
* taskwarrior
* zsh (zprezto)
* Base 16 color schema

Python installer:
================

* virtualenv-wrapper
* flake8 pylint pep8 for python autopep8

Javascript installer:
====================

* eslint babel-eslint eslint-plugin-react for node/js
* gulp
* grunt
* nvm
* avn
* node latest version
* flow-bin
* ternjs

Update
======

Just update configs, if you want to install missed apps or plugins (without running
commands on vim) run installer again.

```bash
cd ~/.linkux-dev && git pull
```

Commands
========

```bash
tls = tmux list
tns = tmux new -s
ta = tmux attach
tat = tmux attach -t
codeit = . codeit.sh  # will run codeit.sh that should automate processes to start a coding
```
Tmux
====

Prefix key: ctrl+o
New session for default ide layout: prefix + P

Neovim
======

If you have to have a startpoint of neovim use [VimGalaxy](https://github.com/linkux-it/vimgalaxy)
