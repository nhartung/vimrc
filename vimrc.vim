" Vundle Requirements
""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My plugins

" Colorscheme plugin
" https://github.com/morhetz/gruvbox
Plugin 'morhetz/gruvbox'

" File Explorer
" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/NERDTree'

" Syntax Checker
" https://github.com/scrooloose/syntastic
Plugin 'scrooloose/syntastic'

" Powershell syntax highlighting and indenting
" https://github.com/PProvost/vim-ps1
Plugin 'PProvost/vim-ps1'

" File Search Utility
" https://github.com/wincent/command-t
" Requires Ruby
Plugin 'wincent/command-t'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Recommended start settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_remove_include_errors = 1
" Using CICADA Syntastic Config
let g:syntastic_cpp_config_file = 'C:\Users\hartung.n\Desktop\Workspace\CICADA\trunk\Source\_syntastic_config'

" Using g++ (On windows I'm using MinGW)
let g:syntastic_cpp_compiler = 'g++' 

" Turn on omnicomplete
set omnifunc=syntaxcomplete#Complete

" Set Colorscheme (using grubbox plugin)
colorscheme gruvbox

" Turn on Syntax Highlighting
syntax on

" Deal with multiple unsaved buffers simultaneously without resorting to misusing tabs.
set hidden

" Backsapce config
set backspace=indent,eol,start

" Show line numbers
set number

" No line wrapping
set nowrap

" Set font to Consolas
if has( 'gui_running' )
	set guifont=Consolas:h9:cANSI
endif

" Tab Settings
set tabstop=3
set shiftwidth=3
set softtabstop=3
set smarttab
set expandtab

" Add column line at column 120
set colorcolumn=120
