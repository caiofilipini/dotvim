"Caio Filipini <caiofilipini@gmail.com>
"
"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

let mapleader = ","

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

"show incomplete cmds down the bottom
set showcmd

"show current mode down the bottom
set showmode

"find the next match as we type the search
set incsearch

"hilight searches by default
set hlsearch

"add line numbers
set number

"trying relativenumber
set relativenumber

"wrap line breaks
set showbreak=...
set wrap linebreak nolist

"disable visual bell
set visualbell t_vb=

"try to make possible to navigate within lines of wrapped lines
set fo=l

"tab and indent settings
set autoindent

"folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=3     "deepest fold is 3 levels
set nofoldenable      "dont fold by default

"make cmdline tab completion similar to bash
set wildmode=list:longest

"enable ctrl-n and ctrl-p to scroll thru matches
set wildmenu

"stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~

"dont continue comments when pushing o/O
set formatoptions-=o

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"setup Vundle
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'fatih/vim-go'
Plugin 'rking/ag.vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'

call vundle#end()

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"backups
set nobackup                      "do not keep backups after close
set nowritebackup                 "do not keep a backup while working
set noswapfile                    "don't keep swp files either
set backupdir=~/.vim/backup       "store backups under ~/.vim/backup
set backupcopy=yes                "keep attributes of original file
set directory=~/.vim/swap,~/tmp,. "keep swp files under ~/.vim/swap
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*

"CtrlP options
let g:ctrlp_extensions            = ['tag']
let g:ctrlp_map                   = ',,'
let g:ctrlp_match_window_bottom   = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_user_command          = ['.git/', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode     = 'r'

set background=dark
colorscheme solarized

"always show status line
set laststatus=2

"enable vim-airline fancy stuff
let g:airline_theme              = 'powerlineish'
let g:airline_powerline_fonts    = 1
let g:airline_enable_branch      = 1
let g:airline_symbols            =  get(g:, 'airline_symbols', {})
let g:airline_left_sep           = '⮀'
let g:airline_left_alt_sep       = '⮁'
let g:airline_right_sep          = '⮂'
let g:airline_right_alt_sep      = '⮃'
let g:airline_symbols.branch     = '⭠'
let g:airline_symbols.readonly   = '⭤'
let g:airline_symbols.linenr     = '⭡'
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_section_c          = '%F'

"== KEYBINDINGS ===================================================
"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer
nnoremap <leader>be :BufExplorer<cr>

"make Y consistent with C and D
nnoremap Y y$

"bindings for ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

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

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Ruby key bindings
"insert hashrocket
imap <C-l> <Space>=><Space>

"remove parentheses from method call
nmap <C-h> i$<Esc>f(r f)xF$x

"Clojure key bindings
"Control + m to send whole buffer to REPL
"nmap <C-m> ggVG<C-c><C-c>

"tabular key mappings
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>ah :Tabularize /=><CR>
vmap <Leader>ah :Tabularize /=><CR>

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
