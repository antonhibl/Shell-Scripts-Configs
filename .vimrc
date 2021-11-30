" Vundle Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'preservim/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'yggdroot/indentline'
Plugin 'ton/vim-alternate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'davidhalter/jedi-vim'
call vundle#end()

" Nerd commenter settings
  " Create default mappings
let g:NERDCreateDefaultMappings = 1
  " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
  " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
  " Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
  " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
  " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
  " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" enable indent guide on start
  "let g:indent_guides_enable_on_vim_startup = 1
let g:indentLine_setConceal = 1

" YCM settings
  " set correct python for ycm server
let g:python3_host_prog='/usr/bin/python3'
  " YCM white-list
let g:ycm_filetype_whitelist = { 'cpp':1, 'h':2, 'hpp':3, 'c':4, 'cxx':5 }

" Syntax Highlighting
  " enable warning messages from the syntax parser
set statusline+=%#warningmsg#
  " flag for the status bar line
set statusline+=%{SyntasticStatuslineFlag()}
  " enable as default
set statusline+=%*

  " syntastic configurations
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Emmett settings
let g:user_emmet_install_global = 0
" Enable emmet only on html and css
autocmd FileType html,css EmmetInstall

" Set tags
set tags?
" Creates tags
!ctags -R

" standard vim settings
  " redundant in newer versions of vim
set nocompatible
" backspace command
set backspace=indent,eol,start
" Relative line numbers on
set relativenumber
" turn line numbering on
set number
" Turn on overlay between numberings
set hidden
" Tab settings
  " width of 4 for all cases
set tabstop=4
set softtabstop=4
set shiftwidth=4
  " do no expand my tabs from spaces
set noexpandtab
" Turn syntax highlighting on
syntax on

" Light bar settings
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

" indenting plugin
filetype plugin indent on

" NerdTree stdin readings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Ignore .git directory, but not .gitignore
let g:NERDTreeIgnore = ['^\.git$', '\.git/.*', '__pycache__$', '.egg-info$', 'dist$', 'build$', 'node_modules$']

" Show dotfiles by default, things we don't care about should have been
" handled by .gitignore
let g:NERDTreeShowHidden = 1

" Nerd Tree Looks
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMinimalUI = 1

" Open NERDTree if no argument, or a directory is provided; set working dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree 
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'cd' argv(0) | ene | NERDTree | wincmd p | endif
let NERDTreeQuitOnOpen=1

" Toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

" save tags
nnoremap <C-s> :!ctags -R<CR>

" Alternating Settings and Binds
nmap <silent> <F4> :Alternate<CR>

" Alternating File Mappings
let g:AlternateExtensionMappings = [{'.cpp' : '.h', '.h' : '.hpp', '.hpp' : '.cpp'}, {'.c': '.h', '.h': '.c'}]

" Ctags save call
autocmd BufWritePost * call system("ctags -R")

" clipboard enabled
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

" PHP Shortcuts

" C-language Shortcuts
autocmd FileType c inoremap ;m int main( int argc, char * argv[] )<Enter>{<Enter><Tab><Enter>}<Esc>kA
autocmd FileType c inoremap #i" #include ""<Esc>i
autocmd FileType c inoremap #i<> #include <><Esc>i
autocmd FileType c inoremap ;$ return 0;
autocmd FileType c inoremap ;spec /*<Enter><Esc>ddAName: <Enter>Process: <Enter>Method Input: <Enter>Method Output(parameters): <Enter>Method Output(returned): <Enter>Device Input: <Enter>Device Output: <Enter>Dependencies: <Enter><Delete>*/<Enter>
