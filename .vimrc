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

" HTML Shortcuts
autocmd FileType html inoremap ;head <head><Enter></head><Esc>kA<Enter>
autocmd FileType html inoremap ;body <body><Enter></body><Esc>kA<Enter>
autocmd FileType html inoremap ;canvas <canvas></canvas><Space><Esc>FcT>i
autocmd FileType html inoremap ;bold <b></b><Space><Esc>FbT>i
autocmd FileType html inoremap ;p <p><Enter><Enter></p><Space><Esc>ki<Space><Space>
autocmd FileType html inoremap ;em <em></em><Space><Esc>FeT>i
autocmd FileType html inoremap ;title <title></title><Space><Esc>FtFtT>i
autocmd FileType html inoremap ;html <html<Space>lang="en-us"><Enter><Enter></html><Space><Esc>ki<Space><Space>
autocmd FileType html inoremap ;div <div><Enter></div><Esc>kA<Enter>
autocmd FileType html inoremap ;sub <sub></sub><Space><Esc>FsT>i
autocmd FileType html inoremap ;sup <sup></sup><Space><Esc>FsT>i
autocmd FileType html inoremap ;small <small></small><Space><Esc>FsT>i
autocmd FileType html inoremap ;strike <strike></strike><Space><Esc>FsT>i
autocmd FileType html inoremap ;footer <footer><Enter><Enter></footer><Space><Esc>ki<Space><Space>
autocmd FileType html inoremap ;span <span><Enter></span><Esc>kA<Enter>
autocmd FileType html inoremap ;br <br><Enter>
autocmd FileType html inoremap ;hr <hr><Enter>
autocmd FileType html inoremap ;img <img<Space>src="url"<Space>alt="text"><Space><Esc>Fui
autocmd FileType html inoremap ;ah <a<Space>href="url"><Space>link<Space>text<Space></a><Space><Esc>Fui
autocmd FileType html inoremap ;ol <ol></ol><Space><Esc>FoT>i
autocmd FileType html inoremap ;ul <ul></ul><Space><Esc>FuT>i
autocmd FileType html inoremap ;li <li></li><Space><Esc>FlT>i
autocmd FileType html inoremap ;dt <dt></dt><Space><Esc>FdT>i
autocmd FileType html inoremap ;dl <dl></dl><Space><Esc>FdT>i
autocmd FileType html inoremap ;dd <dd></dd><Space><Esc>FdhT>i
autocmd FileType html inoremap ;table <table><table><Space><Esc>FtT>i
autocmd FileType html inoremap ;tr <tr></tr><Space><Esc>FtT>i
autocmd FileType html inoremap ;td <td></td><Space><Esc>FtT>i
autocmd FileType html inoremap ;th <th></th><Space><Esc>FtT>i
autocmd FileType html inoremap ;doctype <!DOCTYPE html><Enter>
autocmd FileType html inoremap ;meta <meta<Space>charset="utf-8"<Space>name="viewport"<Space>content="width=device-width,<Space>initial-scale=1.0"><Enter>
autocmd FileType html inoremap <!-- <!-- / --><Space><Esc>F/xi
autocmd FileType html inoremap ;link <link><Enter>
autocmd FileType html inoremap ;form <form></form><Space><Esc>FfT>i
autocmd FileType html inoremap ;input <input></input><Space><Esc>FiT>i
autocmd FileType html inoremap ;css <link<Space>rel="stylesheet"<Space>type="text/css"<Space>href="/style.css"<Space>/><Space><Esc>FyFsi
autocmd FileType html inoremap ;style <style></style><Space><Esc>FsT>i
autocmd FileType html inoremap ;h1 <h1></h1><Space><Esc>FhT>i
autocmd FileType html inoremap ;h2 <h2></h2><Space><Esc>FhT>i
autocmd FileType html inoremap ;h3 <h3></h3><Space><Esc>FhT>i
autocmd FileType html inoremap ;h4 <h4></h4><Space><Esc>FhT>i
autocmd FileType html inoremap ;h5 <h5></h5><Space><Esc>FhT>i
autocmd FileType html inoremap ;h6 <h6></h6><Space><Esc>FhT>i
autocmd FileType html inoremap ;class class=""<Space><Esc>F"i
autocmd FileType html inoremap ;id id=""<Space><Esc>F"i
autocmd FileType html inoremap ;script <script<Space>src=""><Space><Esc>F"i
autocmd FileType html inoremap ;audio <audio<Space>controls><Enter><Enter></audio><Space><Esc>ki<Space><Space>


" CSS Shortcuts

" PHP Shortcuts

" C-language Shortcuts
autocmd FileType c inoremap ;m int main( int argc, char * argv[] )<Enter>{<Enter><Tab><Enter>}<Esc>kA
autocmd FileType c inoremap #i" #include ""<Esc>i
autocmd FileType c inoremap #i<> #include <><Esc>i
autocmd FileType c inoremap ;$ return 0;
autocmd FileType c inoremap ;spec /*<Enter><Esc>ddAName: <Enter>Process: <Enter>Method Input: <Enter>Method Output(parameters): <Enter>Method Output(returned): <Enter>Device Input: <Enter>Device Output: <Enter>Dependencies: <Enter><Delete>*/<Enter>
