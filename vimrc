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

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set number      "add line numbers
set showbreak=...
set wrap linebreak nolist

"disable visual bell
set visualbell t_vb=

"try to make possible to navigate within lines of wrapped lines
set fo=l

"tab and indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

"display tabs and trailing spaces
"set list
"set listchars=tab:\ \ ,extends:>,precedes:<
" disabling list because it interferes with soft wrap

set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"necessary on some Linux distros for pathogen to properly load bundles
filetype off

"load pathogen managed plugins
call pathogen#runtime_append_all_bundles()

"load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"turn off needless toolbar on gvim/mvim
set guioptions-=m
set guioptions-=T

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"hide buffers when not displayed
set hidden

"backups
set nobackup               " do not keep backups after close
set nowritebackup          " do not keep a backup while working
set noswapfile             " don't keep swp files either
set backupdir=~/.vim/backup " store backups under ~/.vim/backup
set backupcopy=yes         " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,. " keep swp files under ~/.vim/swap

"leader-t configuration
let g:CommandTMaxHeight=15
let g:CommandTMatchWindowAtTop=1

if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    if has("gui_gnome")
        set term=gnome-256color
        set guifont=Monaco\ 10
    else
        set guitablabel=%M%t
        set lines=150
        set columns=250
    endif

    if has("gui_mac") || has("gui_macvim")
        set guifont=Menlo:h12

        " key binding for Command-T to behave properly
        " uncomment to replace the Mac Command-T key to Command-T plugin
        " make Mac's Option key behave as the Meta key
        set invmmta
    endif
else
  set t_Co=256

  "dont load csapprox if there is no gui support - silences an annoying warning
  let g:CSApprox_loaded = 1
  let g:CSApprox_verbose_level = 0
endif

colorscheme Tomorrow-Night

"always show statusline
set laststatus=2

"enable vim-powerline fancy icons
let g:Powerline_symbols = 'fancy'

"snipmate setup
try
    source ~/.vim/snippets/support_functions.vim
catch
    source ~/vimfiles/snippets/support_functions.vim
endtry
autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()

    "if we're in a rails env then read in the rails snippets
    if filereadable("./config/environment.rb")
        call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
        call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
    endif

    call ExtractSnips("~/.vim/snippets/html", "eruby")
    call ExtractSnips("~/.vim/snippets/html", "xhtml")
    call ExtractSnips("~/.vim/snippets/html", "php")
endfunction

" == KEYBINDINGS ===================================================
nmap <silent> <Leader>p :NERDTreeToggle<CR>

"make <c-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"map to bufexplorer
nnoremap <leader>be :BufExplorer<cr>

"map to CommandT TextMate style finder
nnoremap <silent> <leader>t :CommandT<CR>

"make Y consistent with C and D
nnoremap Y y$

"bindings for ragtag
inoremap <M-o>       <Esc>o
inoremap <C-j>       <Down>
let g:ragtag_global_maps = 1

"mark syntax errors with :signs
let g:syntastic_enable_signs=1

"long lines can mess up movement - fix that
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nmap <Down> gj
nmap <Up> gk

" tab/shift+tab to navigate between open tabs
nmap <Tab> gt
nmap <S-Tab> gT

" disable
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" insert hashrocket
imap <C-l> <Space>=><Space>

" remove parentheses from method call
nmap <C-h> i$<Esc>f(r f)xF$x

" alias for including ruby debugger
ab rdb require 'ruby-debug';debugger

" save on lost focus
"au FocusLost * :wa

" Edit my .vimrc on new tab
nmap <leader>v :tabedit $MYVIMRC<CR>

" Reload the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Delete trailing white space when saving
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
au BufWrite * :call DeleteTrailingWS()
