set nocompatible

filetype off

call plug#begin('~/.vim/plugged')

     Plug 'flazz/vim-colorschemes'
     "Plug 'sainnhe/gruvbox-material'

     Plug 'mattn/emmet-vim'

     Plug 'tpope/vim-sensible'
     Plug 'tpope/vim-repeat'
     Plug 'tpope/vim-surround'
     Plug 'tpope/vim-unimpaired'
     Plug 'tpope/vim-eunuch'
     Plug 'tpope/vim-ragtag'
     Plug 'wellle/targets.vim'

     Plug 'tpope/vim-commentary'
     Plug 'godlygeek/tabular'
     Plug 'tpope/vim-markdown'

     Plug 'vim-airline/vim-airline'
     Plug 'vim-airline/vim-airline-themes'

     Plug 'leafgarland/typescript-vim'
     Plug 'peitalin/vim-jsx-typescript'

     Plug 'sheerun/vim-polyglot'

     Plug 'cakebaker/scss-syntax.vim'
     Plug 'hail2u/vim-css3-syntax'
     Plug 'othree/html5.vim'

     Plug 'elzr/vim-json'
     Plug 'joaohkfaria/vim-jest-snippets'

     Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
     Plug 'mattn/emmet-vim'

     " JavaScript
     Plug 'HerringtonDarkholme/yats.vim'
     Plug 'pangloss/vim-javascript'
     Plug 'jason0x43/vim-js-indent'
     Plug 'othree/yajs.vim'
     Plug 'maxmellon/vim-jsx-pretty'
     let g:vim_jsx_pretty_colorful_config = 1

     Plug 'w0rp/ale'
     "
     " Git, Fugitive, Extradite, Gutter
     Plug 'tpope/vim-git'
     Plug 'tpope/vim-fugitive'
     Plug 'int3/vim-extradite'
     Plug 'airblade/vim-gitgutter'

     " setlocal spell spelllang=en_us
     autocmd FileType gitcommit setlocal tw=72 | set spell | set colorcolumn=50

     Plug 'elmcast/elm-vim'

     Plug 'kien/ctrlp.vim'
     let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

     "
     """"""""""""""""""""""""""""""""""""""
     " NERDTree

     Plug 'scrooloose/nerdtree'
     Plug 'Xuyuanp/nerdtree-git-plugin'
     noremap <Leader>n :NERDTreeToggle<CR>
     " let NERDTreeWinPos='right'

call plug#end()

" terminal settings
set t_Co=256
set mouse=a
set ttymouse=xterm2
set termguicolors

" fix spell highlight
augroup my_colours
  autocmd!
  autocmd ColorScheme gruvbox hi SpellBad ctermfg=red
augroup END

" theme
" colorscheme molokai
 colorscheme gruvbox
 let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox-material
" let g:gruvbox_material_background = 'hard'

" Airline Config (Plugin)
let g:airline_powerline_fonts = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


set number relativenumber
syntax on

let c_minlines=500
autocmd BufEnter * :syntax sync fromstart

filetype plugin indent on

set splitright
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
autocmd FileType md                 setlocal spell
autocmd FileType jsx                let b:syntastic_checkers = ["eslint"]

autocmd BufRead,BufNewFile *.cshtml set filetype=html
autocmd BufRead,BufNewFile *.md     set filetype=markdown
autocmd BufRead,BufNewFile *.md     set foldlevel=2
autocmd BufRead,BufNewFile *.json   set filetype=json
autocmd BufRead,BufNewFile *.ts     set filetype=typescript
autocmd BufRead,BufNewFile *.jsx    set filetype=javascript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

"COC stuff
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')
"COC stuf end

silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" highlight Pmenu ctermbg=gray guibg=gray

let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'typescript': ['tsserver', 'tslint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint'],
\   'elm': ['elm-format']
\}

let g:ale_fixers = {
 \'javascript': ['eslint', 'prettier'],
 \    'typescript': ['prettier', 'tslint'],
 \    'vue': ['eslint'],
 \    'scss': ['prettier'],
 \    'html': ['prettier'],
 \    'elm': ['elm-format']
 \}
let g:ale_fix_on_save = 1
