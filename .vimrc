set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'preservim/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()
		
set nocompatible
set backspace=indent,eol,start
set number
set hidden

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

syntax on
filetype plugin indent on

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Ignore .git directory, but not .gitignore
let g:NERDTreeIgnore = ['^\.git$', '\.git/.*', '__pycache__$', '.egg-info$', 'dist$', 'build$', 'node_modules$']

" Show dotfiles by default, things we don't care about should have been
" handled by .gitignore
let g:NERDTreeShowHidden = 1

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMinimalUI = 1

" Open NERDTree if no argument, or a directory is provided; set working dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree 
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'cd' argv(0) | ene | NERDTree | wincmd p | endif
let NERDTreeQuitOnOpen=1

map <C-n> :NERDTreeToggle<CR>

set clipboard^=unnamed
