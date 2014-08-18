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

"always show status line
set laststatus=2
