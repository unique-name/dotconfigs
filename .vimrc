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
let airline_theme='onedark'
let airline_powerline_fonts = 1
let airline_extensions = []

"asyncomplete customization
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:asyncomplete_min_chars = 2
let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_code_action_enabled = 0
set signcolumn=no

set completeopt=menuone,noinsert,noselect
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>\<Esc>" : "\<Esc>"
nnoremap <silent> <C-]> :LspDefinition<CR>

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

Plugin 'VundleVim/Vundle.vim'

Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

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

if executable('clangd')
  augroup lsp_clangd
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'clangd',
          \ 'cmd': {server_info->['clangd', '--background-index']},
          \ 'allowlist': ['c', 'cpp'],
          \ })
  augroup END
endif

"mapped hotkey to toggle showing the line numbers
map <C-n> :set nu!<CR>
