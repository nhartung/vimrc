" Using vim-plug as my pluin manager.
" This can be installed by following the instructions here: 
" https://github.com/junegunn/vim-plug

" Initialize vim-plug. Tell it which directory to use for plugins:
call plug#begin('~/.config/nvim/plugged')

" My plugins

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colorscheme plugin
" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

" File Explorer
" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/NERDTree'

" Block Commenter
" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'

" Powershell syntax highlighting and indenting
" https://github.com/PProvost/vim-ps1
Plug 'PProvost/vim-ps1'

" File Search Utility
" https://github.com/wincent/command-t
" Requires Ruby
Plug 'wincent/command-t'

" Text Alignment Utility
" https://github.com/vim-scripts/Align
Plug 'vim-scripts/Align'

" Window Swap Utility
" https://github.com/wesQ3/vim-windowswap
Plug 'wesQ3/vim-windowswap'

" Auto Completion for C++ (among other languages)
" Needs additional compiliation steps for c++ semantics
" See github for installation directions.
" https://github.com/Valloric/YouCompleteMe
" Plug 'Valloric/YouCompleteMe'

" Surround text plugin
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" VCS Markup Plugin
" Usful for showing blames, but also has other features
" https://github.com/vim-scripts/vcscommand.vim
Plug 'vim-scripts/vcscommand.vim'

" Font Size Adjustment Plugin
" https://github.com/drmikehenry/vim-fontsize 
Plug 'drmikehenry/vim-fontsize'

" Auto completion when searching
" https://github.com/vim-scripts/SearchComplete
Plug 'vim-scripts/SearchComplete'

" Diff markup in the gutter
Plug 'mhinz/vim-signify'

" VSCode ctrl-p emulation
Plug 'ctrlpvim/ctrlp.vim'

" Git highlighting in NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" SVN highlighting in NERDTree
" Plug 'greggerz/nerdtree-svn-plugin'

" Color for NERDTree (goes with vim-devicons)
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Adds icons to various vim plugins (including NERDTree)
" LOAD THIS LAST
Plug 'ryanoasis/vim-devicons'

" Calling plug#end updates &runtimepath and initializes the plugin system
call plug#end()

" Put your non-Plugin stuff after this line

" Plugin Settings for nerdcommenter
let g:NERDSpaceDelims = 1       " Add 1 space after comments
let g:NERDCommentEmptyLines = 1 " Comment empty lines

" Turn on omnicomplete
set omnifunc=syntaxcomplete#Complete

" Set Colorscheme (using grubbox plugin)
colorscheme gruvbox

" Bind NERDTreeToggle to <C-f>
nmap <C-f> :NERDTreeToggle<CR>

" NERDTree file ignores
let NERDTreeIgnore = ['\.cod$', '\.sbr$', '\.obj$', '\.idb$', '\.pdb$', '\.pyc$']

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
	set guifont=Consolas:h12:cANSI
endif

" Tab Settings
set tabstop=3
set shiftwidth=3
set softtabstop=3
set smarttab
set expandtab

" Add column line at column 80
set colorcolumn=80
"
" Move backup files (~ files) and swap files
set backupdir=$USERPROFILE\AppData\Local\Temp
set swapfile
set dir=$USERPROFILE\AppData\Local\Temp

" Reloads vimrc after saving but keep cursor position
if !exists('*ReloadVimrc')
   fun! ReloadVimrc()
       let save_cursor = getcurpos()
       source $MYVIMRC
       call setpos('.', save_cursor)
   endfun
endif
autocmd! BufWritePost $MYVIMRC call ReloadVimrc()

" Remaps
" Capitalize word just typed
imap <c-u> <esc>viwUea
" Save in the various modes
nnoremap <c-s> :w<CR> 
inoremap <c-s> <Esc>:w<CR>a
vnoremap <leader>a :Align=<CR>

" Split Navigating via Ctrl + movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Split Resizing via Ctrl + resize
nnoremap > <C-W>2<lt>
nnoremap <lt> <C-W>2>
nnoremap - <C-W>2-
nnoremap = <C-W>2+

" Disable movement via the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
