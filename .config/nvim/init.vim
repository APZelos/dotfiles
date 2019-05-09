" =====================
"  neovim configuration
"
"  Table of Contents
"    Plugins
"    General
"    Theme & Colors
"    UI Config
"    Splits
"    Spaces & Tabs
"    Clipboard
"    Search
"    Filetypes
"    Backup & Swap files
"    Remaps
" =====================

" =====================
"  Plugins
" =====================
call plug#begin('~/.local/share/vnim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': './install.sh' }
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
call plug#end()

" plugin:lightline
function! CocStatus() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  if get(info, 'information', 0)
    call add(msgs, 'I' . info['information'])
  endif
  if get(info, 'hint', 0)
    call add(msgs, 'H' . info['hint'])
  endif
  return join(msgs, ' ')
endfunction

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'CocStatus'
      \ },
      \ }

" plugin:indentLine
let g:indentLine_char='│'

" plugin:vim-javascript
let g:javascript_plugin_jsdoc=1

" plugin:vim-signify
let g:signify_vcs_list=[ 'git' ]
let g:signify_sign_show_count=0
let g:signify_sign_add='█'
let g:signify_sign_delete='█'
let g:signify_sign_delete_first_line='█'
let g:signify_sign_change='█'
let g:signify_sign_changedelete=g:signify_sign_change

" plugin:NERDTree
let NERDTreeShowHidden=1    " shows hidden files (dotfiles etc.)
let NERDTreeQuitOnOpen=1    " closes NERDTree after opening a file
let NERDTreeMinimalUI=1     " hides unnecessary staff
" closes NERDTree if is the last tab open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" =====================
"  General 
" =====================
set hidden                  " required from coc.nvim
set mouse=a                 " enables mouse in all modes
set autoread                " auto reads a file when changed form the outside

" =====================
"  Theme & Colors 
" =====================
set termguicolors           " enables true colors
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_sign_column='dark0_hard'
colorscheme gruvbox

" =====================
"  UI Config 
" =====================
set lazyredraw              " disables unnecessary redraws
set number                  " show current line number
set relativenumber          " show line number relative to current line
set noshowmode              " disables mode status from showing in bottom bar
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
set wildmenu                " visual autocomplete for command menu
set showmatch               " highlight matching brace
set laststatus=2            " window will always have a status line
set signcolumn=yes          " always shows sign column (left gutter)

" =====================
"  Splits 
" =====================
set splitbelow              " make horizontal splits below instead of above
set splitright              " make vertical splits on the right

" =====================
"  Spaces & Tabs 
" =====================
set tabstop=2               " number of visual spaces per TAB
set softtabstop=2           " number of spaces in tab when editing
set shiftwidth=2            " number of spaces to use for autoindent
set expandtab               " tabs are space
set smarttab
set autoindent
set copyindent              " copy indent from the previous line

" =====================
"  Clipboard 
" =====================
set clipboard+=unnamedplus  " enables use of clipboard buffer

" =====================
"  Search 
" =====================
set incsearch               " search as characters are entered
set hlsearch                " highlight matche
set ignorecase              " ignore case when searching
set smartcase               " ignore case if search pattern is lower case

" =====================
"  Filetypes
" =====================
filetype indent on          " use filetype indentation
filetype plugin indent on   " allow plugins to use filetype indentation

" =====================
"  Backup & Swap files 
" =====================
set nobackup
set nowb
set noswapfile

" =====================
"  Remaps
" =====================
" won't skip wrapped lines when moving with `j` and `k`
nnoremap j gj
nnoremap k gk
" ctrl + c for esc in insert mode
inoremap <C-c> <Esc>

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
