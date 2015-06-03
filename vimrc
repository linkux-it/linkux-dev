" for vim 7.4
set encoding=utf-8  " The encoding displayed.
" set fileencoding=utf-8  " The encoding written to file.

" enable syntax highlighting
syntax enable

" show line numbers
set number

" indent when moving to the next line while writing code
set autoindent

" show a visual line under the cursor's current line
set cursorline
set cursorcolumn

" show the matching part of the pair for [] {} and ()
set showmatch

set history=10000
set incsearch
set hlsearch
set autoread
set smarttab 
set undolevels=1000
set relativenumber
set list
set listchars=tab:▸\
set t_Co=256
set background=dark
set clipboard=unnamed

" enable all Python syntax highlighting features
let python_highlight_all = 1
let mapleader = ","
let base16colorspace=256

filetype plugin indent on

" Note: Skip initialization for vim-tiny or vim-small.
  let g:make = 'gmake'
  if system('uname -o') =~ '^GNU/'
  let g:make = 'make'
  endif

  if !1 | finish | endif

  if has('vim_starting')
  if &compatible
   set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  " Required:
  call neobundle#begin(expand('~/.vim/bundle/'))

  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'

  " My Bundles here:
  " Refer to |:NeoBundle-examples|.
  " Note: You don't set neobundle setting in .gvimrc!

  NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'chriskempson/base16-vim' "{{{
  "}}}

  NeoBundle 'SirVer/ultisnips'
  NeoBundle 'Lokaltog/vim-easymotion'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'scrooloose/syntastic' "{{{
    let g:syntastic_error_symbol = '✗'
    let g:syntastic_style_error_symbol = '✠'
    let g:syntastic_warning_symbol = '∆'
    let g:syntastic_style_warning_symbol = '≈'

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
  "}}}

  NeoBundle 'tpope/vim-fugitive' "{{{
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>gr :Gremove<CR>
    autocmd BufReadPost fugitive://* set bufhidden=delete
  "}}}
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'tpope/vim-bundler'

  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'tpope/vim-speeddating'
  NeoBundle 'thinca/vim-visualstar'
  NeoBundle 'tomtom/tcomment_vim'
  NeoBundle 'terryma/vim-expand-region'
  NeoBundle 'terryma/vim-multiple-cursors'
  NeoBundle 'chrisbra/NrrwRgn'
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'christoomey/vim-tmux-navigator'
  NeoBundleLazy 'godlygeek/tabular', {'autoload':{'commands':'Tabularize'}} "{{{
    nmap <Leader>a& :Tabularize /&<CR>
    vmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
  "}}}
  NeoBundle 'jiangmiao/auto-pairs'

  NeoBundle 'bling/vim-airline' "{{{
    set laststatus=2  "Force appear the status line "
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '¦'
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_theme = 'base16'
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
  "}}}
  
  NeoBundle 'severin-lemaignan/vim-minimap'

  NeoBundle 'Shougo/unite.vim' "{{{
    let bundle = neobundle#get('unite.vim')
    function! bundle.hooks.on_source(bundle)
      call unite#filters#matcher_default#use(['matcher_fuzzy'])
      call unite#filters#sorter_default#use(['sorter_rank'])
      call unite#custom#profile('default', 'context', {
            \ 'start_insert': 1
            \ })
    endfunction

    " let g:unite_data_directory=s:get_cache_dir('unite')
    let g:unite_source_history_yank_enable=1
    let g:unite_source_rec_max_cache_files=5000

    if executable('ag')
      let g:unite_source_grep_command='ag'
      let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S -C4'
      let g:unite_source_grep_recursive_opt=''
    elseif executable('ack')
      let g:unite_source_grep_command='ack'
      let g:unite_source_grep_default_opts='--no-heading --no-color -C4'
      let g:unite_source_grep_recursive_opt=''
    endif

    function! s:unite_settings()
      nmap <buffer> Q <plug>(unite_exit)
      nmap <buffer> <esc> <plug>(unite_exit)
      imap <buffer> <esc> <plug>(unite_exit)
    endfunction
    autocmd FileType unite call s:unite_settings()

    nmap <space> [unite]
    nnoremap [unite] <nop>

    nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async:! buffer file_mru bookmark<cr><c-u>
    nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async:!<cr><c-u>
    nnoremap <silent> [unite]e :<C-u>Unite -buffer-name=recent file_mru<cr>
    nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
    nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
    nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer file_mru<cr>
    nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
    nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
    nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>
  "}}}

  NeoBundle 'vim-scripts/PreserveNoEOL'
  NeoBundleLazy 'editorconfig/editorconfig-vim', {'autoload':{'insert':1, 'filetypes': 'all'}} "{{{
    let g:EditorConfig_exclude_patterns = ['fugitive://.*']
    let g:EditorConfig_exclude_patterns = ['scp://.*']
    let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
  "}}}
  "
  NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'], 'autoload':{'commands':'Gitv'}} "{{{
    nnoremap <silent> <leader>gv :Gitv<CR>
    nnoremap <silent> <leader>gV :Gitv!<CR>
  "}}}

  NeoBundleLazy 'davidhalter/jedi-vim', {'autoload':{'filetypes':['python']}} "{{{
    let g:jedi#use_splits_not_buffers = "left"
    "let g:jedi#use_tabs_not_buffers = 0 " Maybe better this than splits?
  "}}}
  NeoBundleLazy 'jmcantrell/vim-virtualenv', {'autoload':{'filetypes':['python']}}

  NeoBundleLazy 'moll/vim-node', {'autoload': {'filetypes':['javascript']}}
  NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less']}}
  NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
  NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
  NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
  NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
  NeoBundleLazy 'wavded/vim-stylus', {'autoload':{'filetypes':['styl']}}
  NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
  NeoBundleLazy 'mustache/vim-mustache-handlebars', {'autoload':{'filetypes':['mustache','handlebars','hbs']}} "{{{
    let g:mustache_abbreviations = 1
  "}}}
  NeoBundleLazy 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}
  NeoBundleLazy 'mattn/emmet-vim', {'autoload':{'filetypes':['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache','handlebars','hbs']}} "{{{
    function! s:zen_html_tab()
      let line = getline('.')
      if match(line, '<.*>') < 0
        return "\<c-y>,"
      endif
      return "\<c-y>n"
    endfunction
    let g:user_emmet_install_global = 0
    autocmd FileType xml,xsl,xslt,xsd,css,sass,scss,less,mustache imap <buffer><tab> <c-y>,
    autocmd FileType html imap <buffer><expr><tab> <sid>zen_html_tab()
  "}}}

  NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
  NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript']}} "{{{
    nnoremap <leader>fjs :call JsBeautify()<cr>
  "}}}
  NeoBundleLazy 'leafgarland/typescript-vim', {'autoload':{'filetypes':['typescript']}}
  NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}} "{{{
    let coffee_indent_keep_current = 1
  "}}}
  NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
  NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee','ls','typescript']}}

  NeoBundleLazy 'scrooloose/nerdtree', {'autoload':{'commands':['NERDTreeToggle','NERDTreeFind']}} "{{{
    let NERDTreeShowHidden=1
    let NERDTreeQuitOnOpen=0
    let NERDTreeShowLineNumbers=1
    let NERDTreeChDirMode=0
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.git','\.hg','\.pyc$','\.DS_Store','\.swp']
    " let NERDTreeBookmarksFile=s:get_cache_dir('NERDTreeBookmarks')
    nmap <leader>ne :NERDTreeToggle<CR>
    nmap <leader>nef :NERDTreeFind<CR>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  "}}}

  NeoBundleLazy 'tpope/vim-scriptease', {'autoload':{'filetypes':['vim']}}
  NeoBundleLazy 'tpope/vim-markdown', {'autoload':{'filetypes':['markdown']}}

  call neobundle#end()

  " Required:
  filetype plugin indent on

  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck

if exists('$TMUX')
  " Easy navigation same as tmux, enjoy it!
  let g:tmux_navigator_no_mappings = 1

  nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

  let g:tmux_navigator_save_on_switch = 1 
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif


"foldmethod ident for some type of files
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
autocmd BufNewFile,BufReadPost *.py setl foldmethod=indent nofoldenable

" Color schema working at this point?
colorscheme base16-ocean
