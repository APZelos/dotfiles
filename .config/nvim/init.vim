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
"    Spelling
"    Filetypes
"    Backup & Swap files
"    Remaps
" =====================

" =====================
"  Plugins
" =====================
call plug#begin('~/.local/share/nvim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'RRethy/vim-illuminate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'mg979/vim-visual-multi'
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'neovimhaskell/haskell-vim'
Plug 'alx741/vim-hindent'
Plug 'elmcast/elm-vim'
Plug 'leafgarland/typescript-vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'mhinz/vim-signify'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'APZelos/blamer.nvim'
Plug 'APZelos/gitline.vim'
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
      \             [ 'cocstatus', 'readonly', 'branchname', 'gitfetchstatus', 'gitfilecount', 'filename', 'gitfilestatus', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'CocStatus',
      \   'gitfilecount': 'gitline#FileCount',
      \   'branchname': 'gitline#BranchName',
      \   'gitfilestatus': 'gitline#FileStatus',
      \   'gitfetchstatus': 'gitline#FetchStatus'
      \ },
      \ }

" plugin:indentLine
let g:indentLine_char='│'

" plugin:vim-illuminate
let g:Illuminate_delay=500

" plugin:vim-json
let g:vim_json_syntax_conceal=0

" plugin:vim-javascript
let g:javascript_plugin_jsdoc=1

" plugin:ale
let g:ale_sign_error='█'
let g:ale_sign_warning='█'
let g:ale_linters={
      \'elm': ['elm_lsp', 'make'],
      \ 'haskell': ['cabal_ghc', 'ghc', 'ghc_mod', 'hdevtools', 'hie', 'hlint', 'stack_build', 'stack_ghc'],
      \}
let g:ale_linters_explicit=1

" plugin:vim-signify
let g:signify_vcs_list=[ 'git' ]
let g:signify_sign_show_count=0
let g:signify_sign_add='│'
let g:signify_sign_delete='│'
let g:signify_sign_delete_first_line='│'
let g:signify_sign_change='│'
let g:signify_sign_changedelete=g:signify_sign_change

" plugin:fzf.vim
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)
" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

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
let g:gruvbox_invert_selection=0
let g:gruvbox_italic=1
colorscheme gruvbox
hi CocErrorHighlight cterm=undercurl gui=undercurl guisp=#fb4934

" =====================
"  UI Config 
" =====================
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
set shiftround              " when hitting tab goes to the next tab stop (default behavior is to add the tabstop value)
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
"  Spelling
" =====================
set spelllang=en            " set English as spelling language
set spell                   " activates spelling

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
" moves lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" makes ctrl + e and ctrl + y move 2 lines at a time
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" plugin:fzf
nnoremap <C-p> :Files<CR>

" plugin:coc.nvim
" goes to definition
nmap <silent> gd <Plug>(coc-definition)
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
" use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
