set number
set noswapfile
"define colorscheme: monokai wombat256
colorscheme wombat256 
set autoindent
"set ruler	 	" shows line number in the status line	 
set wildmenu		" better command line completion, shows a list of matches
set showcmd 
set showmatch
set matchtime=5
set nocompatible	"need for plugins supporting 

"turning off before plugins installation
syntax off
filetype plugin indent off
set rtp+=~/.vim/bundle/vundle/
"installs plugins from list below
call vundle#begin()

Plugin 'scrooloose/nerdtree.git'

"all plugins must be added before this line
call vundle#end() 
"turning on after vundle finished
syntax on
filetype plugin indent on

"-----------------------
" NerdTree customization
" ----------------------
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"hotkey to expand tree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['.*\.o$']
let NERDTreeIgnore+=['.*\.d$']
let NERDTreeIgnore+=['.*\~$']
let NERDTreeIgnore+=['.*\.out$']
let NERDTreeIgnore+=['.*\.so$', '.*\.a$']

