" vim:foldmethod=marker

" ctrl + c for esc in insert mode
inoremap <C-c> <Esc>

" won't skip wrapped lines when moving with `j` and `k`
nnoremap j gj
nnoremap k gk

" toggle folds with leader + space
nnoremap <leader><space> za
vnoremap <leader><space> zf

" makes ctrl + e and ctrl + y move 2 lines at a time
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" remaps delete to not save text
nnoremap d "dd
nnoremap D "dD
vnoremap d "dd
" maps leader + delete to original delete functionality
noremap <leader>d "+d
nnoremap <leader>D "+D
vnoremap <leader>d "+d
" remaps change to not save text
nnoremap c "cc
nnoremap C "cC
vnoremap c "cc
" maps leader + change to original change functionality
nnoremap <leader>c "+c
nnoremap <leader>C "+C
vnoremap <leader>c "+c
" remaps change to not save text
nnoremap s "ss
nnoremap S "sS
vnoremap s "ss
" maps leader + change to original change functionality
nnoremap <leader>s "+s
nnoremap <leader>S "+S
vnoremap <leader>s "+s
" remaps change to not save text
nnoremap x "xx
nnoremap X "xX
vnoremap x "xx
" maps leader + change to original change functionality
nnoremap <leader>x "+x
nnoremap <leader>X "+X
vnoremap <leader>x "+x
