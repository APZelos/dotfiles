" vim:foldmethod=marker

call plug#begin('~/.local/share/nvim/plugged')

" colorscheme {{{
Plug 'fxn/vim-monochrome'
Plug 'arcticicestudio/nord-vim'
Plug 'kyazdani42/blue-moon'
" }}}

" functionality {{{
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-repeat'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-commentary'
Plug 'unblevable/quick-scope'
Plug 'neoclide/coc.nvim', { 'branch': 'release'}
Plug 'maximbaz/lightline-ale'
Plug 'mhinz/vim-signify'
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'APZelos/blamer.nvim'
Plug 'APZelos/gitline.vim'
" }}}


" highlighting {{{
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
" }}}

call plug#end()
