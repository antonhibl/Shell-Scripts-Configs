set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'preservim/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
call vundle#end()

let g:python3_host_prog='/usr/bin/python3'
let g:ycm_filetype_whitelist = { 'cpp':1, 'h':2, 'hpp':3, 'c':4, 'cxx':5 }

set nocompatible
set backspace=indent,eol,start
set number
set hidden
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

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

" Code Shortcut Tag
autocmd FileType html inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

" HTML Shortcuts
autocmd FileType html inoremap ;h <h></h><Space><++><Esc>FhT>
autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>
autocmd FileType html inoremap ;p <p></p><Enter><Enter><++><Esc>2ki

" C-language Shortcuts
autocmd FileType c inoremap ;m int main( int argc, int argv[] )<Enter>{<Enter><Tab><Enter>}<Esc>kA
autocmd FileType c inoremap #i" #include ""<Esc>i
autocmd FileType c inoremap #i<> #include <><Esc>i
autocmd FileType c inoremap ;$ return 0;
autocmd FileType c inoremap ;spec /*<Enter><Esc>ddAName: <Enter>Process: <Enter>Method Input: <Enter>Method Output(parameters): <Enter>Method Output(returned): <Enter>Device Input: <Enter>Device Output: <Enter>Dependencies: <Enter><Delete>*/<Enter>
