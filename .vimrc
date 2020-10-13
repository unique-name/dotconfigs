set number
:set noswapfile
"choose one of the following colorschemes. Default: wombat256

colorscheme wombat256 
filetype plugin indent on
set tabstop=8		"show existing tab measured in spaces 
set softtabstop=8	"default tab stop size for editing files with other tabs value
set shiftwidth=8	"the size of an indent 
set noexpandtab		"no spaces instead tabs
set wildmenu		"better command line completion, shows a list of matches
set so=999		"keep cursor centered on the screen
set laststatus=2	"airline
let airline_theme='powerlineish'
let airline_powerline_fonts = 1
let g:airline_extensions = []
set t_Co=256
set showmatch		"show matching brackets
set nocompatible	"need for plugins supporting 
set encoding=utf-8
let rainbow_active = 1
let rainbow_ctermfgs = ['blue']

if &diff
	syntax off
	"colorscheme industry
	colorscheme wombat256
	set nonumber
	set softtabstop=4
	set tabstop=4
endif

"turning off before plugins installation
syntax off
filetype plugin indent off
set rtp+=~/.vim/bundle/vundle/
"installs plugins from list below
call vundle#begin()

Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'frazrepo/vim-rainbow'

"all plugins must be added before this line
call vundle#end() 
"turning on after vundle finished
syntax on
filetype plugin indent on

"setting restrict and highlighting for line length exceeding
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%101v', 100)

"YouCompleteme customization
"---------------------------
let ycm_confirm_extra_conf = 0
let ycm_auto_hover = ''		"disable preview pop up window
map <C-f> :YcmRestartServer<CR>

