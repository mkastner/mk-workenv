" BASIC SETUP

" if you want to stop the bell
" set visualbell
" set t_vb=
autocmd! bufwritepost .vimrc source % 
" something progressive
set nocompatible

set nobackup noswapfile

" current file is current dir
" set autochdir

set path+=**
set wildignore+=**/node_modules/**

" make copy to osx past buffer

if $TMUX == ''
  set clipboard+=unnamed
endif

" setting tab to 2 chars
set tabstop=2
set shiftwidth=2
set expandtab 

" display all matching files when tab complete
set wildmenu

" show line numbers
set number

" prevent esc timeout
set timeoutlen=1000 ttimeoutlen=0

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" zoom in zoom out
" noremap Zz <c-w>_\|<c-w>\|
" noremap Zo <c-w>=

" easy navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" fzf file fuzzy search that respects .gitignore
" If in git directory, show only files that are committed, staged, or unstaged
" else use regular :Files
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')

" highlight current line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" This is NOT working
" set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
" set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto

" This is WORKING
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors

" got this from here
" http://ellengummesson.com/blog/2014/02/22/make-vim-really-behave-like-netrw/
" enable treestyle lists
let g:netrw_liststyle=3
" disable banner
let g:netrw_banner=0

" set previous window right of project drawer
" let g:netrw_browse_split=4
" let g:netrw_altv=1

" set winsize to 25% - NOT IMPLEMENTED
" let g:netrw_winsize=25

" If installed using Homebrew
" set rtp+=/usr/local/opt/fzf

" using Plug Plugin Manager

" if empty(glob('~/.vim/autoload/plug.vim'))
"    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"    endif

" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \}

call plug#begin('~/.vim/plugged')

" If installed using Homebrew
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'shmargum/vim-sass-colors'
" Plug 'ryanoasis/vim-devicons' 
" Plug 'justinmk/vim-dirvish'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Plug 'ap/vim-css-color'

" highlights backtick etc.
Plug 'pangloss/vim-javascript'

Plug 'patstockwell/vim-monokai-tasty'

Plug 'tpope/vim-obsession'

" linter plugin
Plug 'dense-analysis/ale'

" vue 
Plug 'posva/vim-vue'

" nginx
Plug 'chr4/nginx.vim'

" beautyfier 
Plug 'maksimr/vim-jsbeautify'

" seems to be needed for ack to work properly
Plug 'tpope/vim-dispatch'

" its ack
Plug 'mileszs/ack.vim'

Plug 'mattn/emmet-vim'

" graphql support
Plug 'jparise/vim-graphql'

" bottom status bar
Plug 'vim-airline/vim-airline'

" Javascript Docs 
Plug 'heavenshell/vim-jsdoc'

call plug#end()

let g:javascript_plugin_jsdoc = 1
let g:user_emmet_leader_key=','

" let g:ale_javascript_eslint_use_global = 1
" let g:ale_sign_column_always = 0 
" show ale errors in status line
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '➤'

" let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 'always'

" let g:ack_use_dispatch = 1

" let g:jsdoc_enable_es6 = 1

"  let g:airline_theme = 'monokai_tasty'
" let g:lightline = { 'colorscheme': 'monokai_tasty' }

" let g:ale_linters = {
" \  'javascript': ['eslint'],
" \}

