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
* nvm
* ack
* taskwarrior
* zsh (zprezto)
* Base 16 color schema

Python installer:
================

* virtualenv-wrapper
* flake8 pylint pep8 for python

Javascript installer:
====================

* eslint babel-eslint eslint-plugin-react for node/js
* gulp
* grunt
* node latest version
* iojs laste version

Update
======

Just update configs, if you want to install missed apps or plugins (without running
commands on vim) run installer again.

```bash
cd ~/.linkux-dev && git pull
```

Tmux
====

Prefix key: ctrl+o
New session for default ide layout: prefix + P

NeoVim
===

You have to read each plugin for docs and how to use each features

Plugins used:
 - Common
  - [Neobundle](https://github.com/Shougo/neobundle.vim) Plugin Manager for vim/neovim
  - [Base16 Theme](https://github.com/chriskempson/base16-vim) Just use another theme than the default.
  - [vimproc](https://github.com/Shougo/vimproc.vim) Recommended by neobundle
  - [unite](https://github.com/Shougo/unite.vim) Really cool features for fuzzy searches, previews, switches
  - [NerdTree](https://github.com/scrooloose/nerdtree) Filesystem view, ctrl-n to open
  - [Easymotion](https://github.com/Lokaltog/vim-easymotion)
  - [Surround](https://github.com/tpope/vim-surround)
  - [ESLint](https://github.com/scrooloose/syntastic/tree/master/syntax_checkers)  Syntax chekers
  - [Editor config](https://github.com/editorconfig/editorconfig-vim) To manage team conventions on editors, not only vim
  - [Figitive](https://github.com/tpope/vim-fugitive) Git integration
  - [GitV](https://github.com/gregsexton/gitv) gitk inside vim
  - [ultisnips](https://github.com/SirVer/ultisnips) Snippets
  - [Comments](https://github.com/tomtom/tcomment_vim)
  - [Expand selections](https://github.com/terryma/vim-expand-region)
  - [Multiple cursors](https://github.com/terryma/vim-multiple-cursors)
  - [Protected Selection Edits](https://github.com/chrisbra/NrrwRgn)
  - [Tabularize](https://github.com/godlygeek/tabular)
  - [Auto pairs](https://github.com/jiangmiao/auto-pairs)
  - [Vim Airline](https://github.com/bling/vim-airline)
  - [Vim Scriptease](https://github.com/tpope/vim-scriptease)
  - [Vim Markdown](https://github.com/tpope/vim-markdown)
  - [Git Gutter](https://github.com/airblade/vim-gitgutter)
  - [Tmux and Vim Navigator](christoomey/vim-tmux-navigator)

 - HTML, CSS, Javascript
  - [Emmet](https://github.com/mattn/emmet-vim) Really cool for this
  - [Less](https://github.com/groenewege/vim-less)
  - [SCSS](https://github.com/cakebaker/scss-syntax.vim)
  - [CSS3](https://github.com/hail2u/vim-css3-syntax)
  - [CSS](https://github.com/ap/vim-css-color)
  - [Html5](https://github.com/othree/html5.vim)
  - [Stylus](https://github.com/wavded/vim-stylus)
  - [Jade](https://github.com/digitaltoad/vim-jade)
  - [Mustache](https://github.com/juvenn/mustache.vim)
  - [MatchTag](https://github.com/gregsexton/MatchTag)
  - [Javascript](https://github.com/pangloss/vim-javascript)
  - [JsBeautify](https://github.com/maksimr/vim-jsbeautify)
  - [TypeScript](https://github.com/leafgarland/typescript-vim)
  - [Coffee Script](https://github.com/kchmck/vim-coffee-script)
  - [JSON](https://github.com/leshill/vim-json)
  - [Javascript libraries snxtax](https://github.com/othree/javascript-libraries-syntax.vim)

 - Node
  - [Nodejs](https://github.com/moll/vim-node) Syntax and other tools for node

 - Python
  - [Jedi](https://github.com/davidhalter/jedi-vim) autcomplete, refactor and more
  - [Snnippeds](https://github.com/SirVer/ultisnips)
  - [Virtualenv](https://github.com/jmcantrell/vim-virtualenv)

 - Ruby - Rails
  - [Rails](https://github.com/tpope/vim-rails)
  - [Bundler](https://github.com/tpope/vim-bundler)
  - [Endwise](https://github.com/tpope/vim-endwise)
  - [SpeedDate](https://github.com/tpope/vim-speeddating) Increase date time
  - [Visual start](https://github.com/thinca/vim-visualstar)

 - For later?
  - [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
