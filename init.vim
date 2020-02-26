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

" Airline Upgrade
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

" Settings for NERDTree devicons
" whether or not to show the nerdtree brackets around flags
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" NERDTree Settings
" Bind NERDTreeToggle to <C-f>
nmap <C-f> :NERDTreeToggle<CR>

" NERDTree file ignores
let NERDTreeIgnore = ['\.cod$', '\.sbr$', '\.obj$', '\.idb$', '\.pdb$', '\.pyc$']
" Sort numbers numerically
let NERDTreeNaturalSort = 1

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'wombat'

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
set swapfile

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

" coc settings
" coc config
" Some future extensions to look into:
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-python',
  \ ]
" The below were all copy and pasted
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
