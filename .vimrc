set number
set noswapfile
"choose one of the following colorschemes. Default: wombat256
colorscheme wombat256 
filetype plugin indent on
set tabstop=8		"show existing tab measured in spaces 
set softtabstop=8	"default tab stop size for editing files with other tabs value
set shiftwidth=8	"the size of an indent 
set noexpandtab		"no spaces instead tabs
set wildmenu		"better command line completion, shows a list of matches
set so=999		"keep cursor centered on the screen
set laststatus=2	"powerline
set t_Co=256		"powerline
set showmatch		"show matching brackets
set nocompatible	"need for plugins supporting 
set encoding=utf-8


"turning off before plugins installation
syntax off
filetype plugin indent off
set rtp+=~/.vim/bundle/vundle/
"installs plugins from list below
call vundle#begin()

Plugin 'scrooloose/nerdtree.git'
Plugin 'powerline/powerline.git'
Plugin 'Valloric/YouCompleteMe'

"all plugins must be added before this line
call vundle#end() 
"turning on after vundle finished
syntax on
filetype plugin indent on

highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


" NerdTree customization
" ----------------------
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['.*\.o$']
let NERDTreeIgnore+=['.*\.d$']
let NERDTreeIgnore+=['.*\~$']
let NERDTreeIgnore+=['.*\.out$']
let NERDTreeIgnore+=['.*\.so$', '.*\.a$']

"PowerLine customization
"-----------------------
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

"YouCompleteme customization
"---------------------------
let g:ycm_confirm_extra_conf = 0
"let g:ycm_add_preview_to_completeopt = 0		"preview top window
"let g:ycm_autoclose_preview_window_after_insertion = 1	"preview top window
set completeopt-=preview				"disable preview window
map <C-f> :YcmRestartServer<CR>
