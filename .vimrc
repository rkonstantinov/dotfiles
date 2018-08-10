set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins {
     Plugin 'gmarik/vundle'
     Plugin 'flazz/vim-colorschemes'

     " markup
     Plugin 'tpope/vim-ragtag'

     " JavaScript
     Plugin 'pangloss/vim-javascript'
     Plugin 'jason0x43/vim-js-indent'
     Plugin 'othree/yajs.vim'
     Plugin 'mxw/vim-jsx'

     " Git, Fugitive, Extradite, Gutter
     Plugin 'tpope/vim-git'
     Plugin 'tpope/vim-fugitive'
     Plugin 'int3/vim-extradite'
     Plugin 'airblade/vim-gitgutter'

     autocmd FileType gitcommit setlocal tw=72 | set spell | set colorcolumn=50

     Plugin 'kien/ctrlp.vim'
     "
     """"""""""""""""""""""""""""""""""""""
     " NERDTree

     Plugin 'scrooloose/nerdtree'
     Plugin 'Xuyuanp/nerdtree-git-plugin'
     noremap <Leader>n :NERDTreeToggle<CR>
     let NERDTreeWinPos='right'

     call vundle#end()            " required
     filetype plugin indent on    " required
"}

" terminal settings
set t_Co=256
set mouse=a
set ttymouse=xterm2

" theme
colorscheme nazca

set number relativenumber
syntax on

let c_minlines=500
autocmd BufEnter * :syntax sync fromstart

filetype plugin indent on

set clipboard+=unnamed
set encoding=utf-8

" show the cursor position all the time
set ruler

set nobackup
set nowritebackup
set noerrorbells
set backspace=2

set ignorecase
set smartcase
set incsearch
set showmatch
set nohlsearch

set laststatus=2
set lazyredraw
set ruler
set scrolloff=10
set startofline
set showmatch
set list listchars=trail:.
set noswapfile

" Text Formatting
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

" Folding
set nofoldenable
set foldmarker={,}
set foldmethod=marker
set foldlevel=100
set hidden

" GUI Settings
"set guifont=monospace:h11

"remove trailin whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType gitcommit          setlocal spell
autocmd FileType jsx                let b:syntastic_checkers = ["eslint"]

autocmd BufRead,BufNewFile *.cshtml set filetype=html
autocmd BufRead,BufNewFile *.md     set filetype=markdown
autocmd BufRead,BufNewFile *.md     set foldlevel=2
autocmd BufRead,BufNewFile *.json   set filetype=json
autocmd BufRead,BufNewFile *.ts     set filetype=javascript
"autocmd BufRead,BufNewFile *.jsx    set filetype=javascript
