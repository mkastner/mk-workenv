" BASIC SETUP

" if you want to stop the bell
" set visualbell
" set t_vb=
autocmd! bufwritepost .vimrc source % 
" something progressive
set nocompatible
set t_Co=256
" colors koehler 

set nobackup noswapfile
" current file is current dir
" set autochdir

set path+=**
set wildignore+=**/node_modules/**

" all things folding
set foldmethod=syntax  
set foldnestmax=10
set nofoldenable
set foldlevel=2



" make copy to osx past buffer

if $TMUX == ''
  set clipboard+=unnamed
endif

" setting tab to 2 chars
set tabstop=2
set shiftwidth=2
set expandtab 
" otherwise webpack will not be able to do hot reload
set backupcopy=yes

" display all matching files when tab complete
set wildmenu

" show line numbers
set number

" prevent esc timeout
set timeoutlen=1000 ttimeoutlen=0

set hidden

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin indent on

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

""" Customize colors

" set termguicolors

func! s:my_colors_setup() abort
    " this is an example
  highlight Pmenu ctermbg=darkblue ctermfg=white
  highlight PmenuSel ctermbg=lightblue ctermfg=darkblue
  highlight PmenuSbar ctermbg=DarkGray ctermfg=white
  highlight PmenuThumb ctermbg=NONE ctermfg=White
  highlight Search ctermbg=Blue ctermfg=White
  highlight CocInfoFloat ctermbg=darkblue ctermfg=white
  highlight CocErrorFloat ctermbg=darkred ctermfg=lightyellow
  highlight CocWarningFloat ctermbg=darkred ctermfg=lightyellow
  highlight CocHintFloat ctermbg=darkblue ctermfg=yellow
endfunc

augroup colorscheme_coc_setup | au!
    au ColorScheme * call s:my_colors_setup()
augroup END

augroup Racer
  autocmd!
  autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
  autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
  autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
  autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
  autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
  autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END


" This is NOT working on MAC but on FreeBSD
" set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
" set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto

" This is WORKING on FreeBSD but on MAC 
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:vimspector_enable_mappings = 'HUMAN'

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
" set rtp+=/usr/local/bin/fzf

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

Plug 'puremourning/vimspector'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'ryanoasis/vim-devicons' 
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-obsession'

Plug 'posva/vim-vue'

Plug 'rust-lang/rust.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'tpope/vim-dispatch'
Plug 'mileszs/ack.vim'
Plug 'mattn/emmet-vim'
Plug 'jparise/vim-graphql'
Plug 'heavenshell/vim-jsdoc'

call plug#end()

let g:vim_svelte_plugin_use_sass = 1
let g:vim_svelte_plugin_debug = 1

let g:racer_cmd="/home/devel/.cargo/bin/racer"
let g:racer_experimental_completer = 1

" let g:LanguageClient_serverCommands = {
" \ 'rust': ['rust-analyzer'],
" \ }


let g:javascript_plugin_jsdoc = 1
let g:user_emmet_leader_key=','

" let g:ale_javascript_eslint_use_global = 1
" let g:ale_sign_column_always = 0 
" show ale errors in status line
" let g:airline#extensions#ale#enabled = 1
" let g:ale_sign_error = '➤'
" let g:ale_sign_error = '➤'

" let g:ale_lint_on_enter = 1
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 'always'

" let g:ack_use_dispatch = 1

" let g:jsdoc_enable_es6 = 1

colors slate 
"set t_Co=256


" let g:ale_linters = {
" \  'javascript': ['eslint'],
" \}
" if executable('rls')
"  au User lsp_setup call lsp#register_server({
"    \ 'name': 'rls',
"    \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
"    \ 'whitelist': ['rust'],
"    \ })
" endif 
