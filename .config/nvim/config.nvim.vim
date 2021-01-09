" vim:foldmethod=marker

" General {{{
set hidden                  " required from coc.nvim
set mouse=a                 " enables mouse in all modes
set autoread                " auto reads a file when changed form the outside
set updatetime=300
set shortmess+=c
" }}}

" Theme & Colors {{{
set termguicolors           " enables true colors
colorscheme nord
hi CocErrorHighlight cterm=undercurl gui=undercurl guisp=#fb4934
" }}}

" UI Config {{{
set lazyredraw              " disables unnecessary redraws
set number                  " show current line number
set relativenumber          " show line number relative to current line
set noshowmode              " disables mode status from showing in bottom bar
set showcmd                 " show command in bottom bar
set guicursor+=i:block-Cursor
set cursorline              " highlight current line
set wildmenu                " visual autocomplete for command menu
set showmatch               " highlight matching brace
set laststatus=2            " window will always have a status line
set signcolumn=yes          " always shows sign column (left gutter)
set scrolloff=5             " always shows 5 line before/after cursor
" }}}

" Splits {{{
set splitbelow              " make horizontal splits below instead of above
set splitright              " make vertical splits on the right
" }}}

" Spaces & Tabs {{{
set tabstop=2               " number of visual spaces per TAB
set softtabstop=2           " number of spaces in tab when editing
set shiftwidth=2            " number of spaces to use for autoindent
set expandtab               " tabs are space
set shiftround              " when hitting tab goes to the next tab stop (default behavior is to add the tabstop value)
set smarttab
set autoindent
set copyindent              " copy indent from the previous line
" }}}

" Clipboard {{{
set clipboard+=unnamedplus  " enables use of clipboard buffer
" }}}

" Leader {{{
let mapleader=" "
let g:mapleader=" "
" }}}

" Search {{{
set incsearch               " search as characters are entered
set hlsearch                " highlight matche
set ignorecase              " ignore case when searching
set smartcase               " ignore case if search pattern is lower case
" }}}

" Spelling {{{
set spelllang=en            " set English as spelling language
set nospell                 " activates spelling
" }}}

" Undo {{{
set undofile                " persistent undos - undo after you re-open the file
set undodir=~/.cache/nvim/dirs/undodir
" }}}

" Filetypes {{{
filetype indent on          " use filetype indentation
filetype plugin indent on   " allow plugins to use filetype indentation
" }}}

" Backup & Swap files {{{
set backup                  " make backup files
set directory=~/.cache/nvim/dirs/tmp
set backupdir=~/.cache/nvim/dirs/backups
" }}}
