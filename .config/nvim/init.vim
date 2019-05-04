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
Plug 'pangloss/vim-javascript'
call plug#end()

" plugun:vim-javascript
let g:javascript_plugin_jsdoc=1

" =====================
"  General 
" =====================
set mouse=a                 " enables mouse in all modes
set autoread                " auto reads a file when changed form the outside

" =====================
"  Theme & Colors 
" =====================
set termguicolors           " enables true colors
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" =====================
"  UI Config 
" =====================
set lazyredraw              " disables unnecessary redraws
set number                  " show current line number
set relativenumber          " show line number relative to current line
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
set wildmenu                " visual autocomplete for command menu
set showmatch               " highlight matching brace
set laststatus=2            " window will always have a status line

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
