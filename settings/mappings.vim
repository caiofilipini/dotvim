"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to buffer explorer
nnoremap <leader>be :CtrlPBuffer<cr>

"make Y consistent with C and D
nnoremap Y y$

"mark syntax errors with :signs
let g:syntastic_enable_signs = 1

"long lines can mess up movement - fix that
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nmap <Down> gj
nmap <Up> gk

"tab/shift+tab to navigate between open tabs
nmap <Tab> gt
nmap <S-Tab> gT

"Ruby key bindings
"insert hashrocket
imap <C-l> <Space>=><Space>

"remove parentheses from method call
nmap <C-h> i$<Esc>f(r f)xF$x

"Edit my .vimrc on new tab
nmap <leader>v :tabedit $MYVIMRC<CR>

"Reload the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"Delete trailing white space when saving
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
au BufWrite * :call DeleteTrailingWS()
