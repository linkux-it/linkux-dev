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

Apps to be used:
================

* git
* neovim
* tmux
* nvm
* node (install manually with nvm)
* iojs (install manually with nvm)
* virtualenv-wrapper
* ack
* taskwarrior
* zsh (zprezto)
* Base 16 color schema
* flake8 pylint pep8 for python
* eslint babel-eslint eslint-plugin-react for node/js
* gulp
* grunt


Install basic apps, instalation scripts.
========================================

- Common

  installer/python.sh
  installer/javascript.sh

- For OSX

  installer/osx/basic.sh
  installer/osx/settings.sh

- For Ubuntu/Debian

  installer/ubuntu/basic.sh
  installer/ubuntu/settings.sh

-------------------------------------------------------------

Based on :

**Be sure**

To install Base16 color for your terminal: https://github.com/chriskempson/base16
To install Base16-shell for your shell: https://github.com/chriskempson/base16-shell

We don't install it because depends on your needs and preferences.

Also install so you can check python code, not automatic update because we will need super user permissions

```bash
pip install flake8 pylint pep8
npm install -g eslint babel-eslint eslint-plugin-react 
```

Install
=======

You need python neovim package installed

```bash
pip install neovim  # or any other form
```

To install all app, dependencies. This not install neovim by default set

```bash
export ALLOW_INSTALL=1 
```

To install neovim, only install on OSX and ubuntu

```bash
export INSTALL_NEOVIM=1
```

To config neovim instead of vim (config files setup this), be sure you have it
installed. You can run installer for both running twice one setting up this
and the other without it, use whichever you want!

```bash
export CONFIG_NEOVIM=1
```

To install just for vim

```bash
curl -s https://raw.githubusercontent.com/linkux-it/linkux-dev/master/install.sh | bash
```

If you want alternatives on Ubuntu

```bash
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
```
Update
======

Just update configs, if you want to install missed apps or plugins (without running
commands on vim) run installer again.

```bash
cd ~/.linkux-dev && git pull
```

Vim
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
