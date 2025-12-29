"choose one of the following colorschemes. Default: wombat256
colorscheme OceanicNext

filetype plugin indent on

:set noswapfile
set number
set tabstop=4		"show existing tab measured in spaces 
set softtabstop=4	"default tab stop size for editing files with other tabs value
set shiftwidth=4	"the size of an indent 
set expandtab
set wildmenu		"better command line completion, shows a list of matches
set so=999		"keep cursor centered on the screen
set t_Co=256
set showmatch		"show matching brackets
set nocompatible	"need for plugins supporting 
set encoding=utf-8
set ignorecase
set smartcase
let rainbow_active = 1
let rainbow_ctermfgs = ['blue']
let AutoPairsMultilineClose = 0

"airline customiazation
set laststatus=2		"airline
let airline_theme='powerlineish'
let airline_powerline_fonts = 1
let airline_extensions = []

"mucompleteme customization
set completeopt=menuone,noselect
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['keyn', 'tags', 'omni', 'path']

if &diff
	syntax off
	colorscheme OceanicNext
	set nonumber
	set softtabstop=4
	set tabstop=4
endif

"turning off before plugins installation
syntax off
filetype plugin indent off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'lifepillar/vim-mucomplete'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'frazrepo/vim-rainbow'
Plugin 'tpope/vim-fugitive'

call vundle#end() 
"turning on after vundle finished
syntax on
filetype plugin indent on

"setting restrict and highlighting for line length exceeding
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%101v', 100)

"mapped hotkey to toggle showing the line numbers
map <C-n> :set nu!<CR>
