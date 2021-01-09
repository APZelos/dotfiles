" vim:foldmethod=marker

" lightline {{{
" configuration
let g:lightline#ale#indicator_checking = "..."
let g:lightline#ale#indicator_warnings = ""
let g:lightline#ale#indicator_errors = ""

let g:lightline = {
      \   'colorscheme': 'nord',
      \ }
let g:lightline.active = {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'readonly', 'git_branch_name', 'git_fetch_status', 'git_file_count', 'filename', 'git_file_status', 'modified' ]
      \   ],
      \   'right': [
      \     [ 'lineinfo' ],
      \     [ 'filetype' ],
      \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
      \   ],
      \ }
let g:lightline.inactive = {
      \   'left': [
      \     [ 'filename' , 'modified' ]
      \   ],
      \   'right': [
      \   ]
      \ }
let g:lightline.component_function = {
      \ 'git_branch_name': 'gitline#BranchName',
      \ 'git_fetch_status': 'gitline#FetchStatus',
      \ 'git_file_count': 'gitline#FileCount',
      \ 'git_file_status': 'gitline#FileStatus',
      \ }
let g:lightline.component_expand = {
      \ 'linter_checking': 'lightline#ale#checking',
      \ 'linter_warnings': 'lightline#ale#warnings',
      \ 'linter_errors': 'lightline#ale#errors',
      \ 'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \ 'linter_warnings': 'warning',
      \ 'linter_errors': 'error'
      \ }
" }}}

" quick-scope {{{
" configuration
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}

" vim-json {{{
" configuration
let g:vim_json_syntax_conceal=0
" }}}

" vim-javascript {{{
" configuration
let g:javascript_plugin_jsdoc=1
" }}}

" ale {{{
" configuration
let g:ale_sign_error='█'
let g:ale_sign_warning='█'
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '   '
let g:ale_disable_lsp = 1
" }}}

" coc.nvim {{{
" configuration
" @ coc-settings.json

" functions
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" remaps
nmap <silent> gd <Plug>(coc-definition)
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" }}}

" vim-signify {{{
" configuration
let g:signify_vcs_list=[ 'git' ]
let g:signify_sign_show_count=0
let g:signify_sign_add='│'
let g:signify_sign_delete='│'
let g:signify_sign_delete_first_line='│'
let g:signify_sign_change='│'
let g:signify_sign_changedelete=g:signify_sign_change
" }}}

" fzf.vim {{{
" configuration
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" functions
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(&lines * 0.85) " 85% of screen
  let width = float2nr(&columns * 0.9) " 90% of screen
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = float2nr(((&lines - height) / 2) - 1)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'anchor': 'NW',
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" cmds
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" remaps
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-g> :GitFiles?<CR>
" }}}

" NERDTree {{{
" configuration
let NERDTreeShowHidden=1    " shows hidden files (dotfiles etc.)
let NERDTreeQuitOnOpen=1    " closes NERDTree after opening a file
let NERDTreeMinimalUI=1     " hides unnecessary staff
let g:NERDTreeWinSize=45

" cmds
" closes NERDTree if is the last tab open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" remaps
nnoremap <silent> <expr> <C-f> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"
" }}}
