# Dev Tools used by Linkux IT

Will create and setup the environment with vim + tmux and other cool features for quick coding on
OSX and Ubuntu (Debian hasn't package for neovim yet).

This ensure to install:
 * git
 * tmux
 * vim
 * neovim (if requested only for OSX and Ubuntu)

Install
=======

To install neovim, only install on OSX and ubuntu

> export INSTALL_NEOVIM=1

To config neovim instead of vim (config files setup this), be sure you have it
installed. You can run installer for both running twice one setting up this
and the other without it, use whichever you want!

> export CONFIG_NEOVIM=1

To install just for vim

> curl https://raw.githubusercontent.com/linkux-it/linkux-dev/master/install.sh | bash

If you want alternatives on Ubuntu

> Set alternatives
> sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
> sudo update-alternatives --config vi
> sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
> sudo update-alternatives --config vim
> sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
> sudo update-alternatives --config editor

Update
======

> cd ~/.linkux-dev && git pull

Vim
===

You have to read each plugin for docs and how to use each features

Plugins used:
 - Common
   - [Neobundle](https://github.com/Shougo/neobundle.vim) Plugin Manager for vim/neovim
   - [Base16 Theme](https://github.com/chriskempson/base16-vim) Just use another theme than the default.
   - [vimproc](https://github.com/Shougo/vimproc.vim) Recommended by neobundle
   - [unite](https://github.com/Shougo/unite.vim)
   - [NerdTree](https://github.com/scrooloose/nerdtree) This is useful?
   - [Easymotion](https://github.com/Lokaltog/vim-easymotion)
   - [Surround](https://github.com/tpope/vim-surround)
   - [ESLint](https://github.com/scrooloose/syntastic/tree/master/syntax_checkers)  need all syntaxs?
   - [Editor config](https://github.com/editorconfig/editorconfig-vim) To manage team conventions on editors, not only vim
   - [Figitive](https://github.com/tpope/vim-fugitive) it is a git integration... maybe useful?

 - HTML, CSS, Javascript
   - [Emmet](https://github.com/mattn/emmet-vim) Really cool for this

 - Node
   - [Nodejs](https://github.com/moll/vim-node) Syntax and other tools for node

 - Python
   - [Jedi](https://github.com/davidhalter/jedi-vim) autcomplete, refactor and more
   - [Snnippeds](https://github.com/SirVer/ultisnips)


 - For later?
   - [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
