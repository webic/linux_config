"dont use compatibility mode
set nocompatible
"file type detect
filetype off
"config Vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"Vundle itself
Plugin 'gmarik/Vundle.vim'
"syntax checking hacks
Plugin 'scrooloose/syntastic'
"file tree
Plugin 'scrooloose/nerdtree'
"tabline
Plugin 'vim-airline/vim-airline'
"pep8
Plugin 'yggdroot/indentLine'
Plugin 'nvie/vim-flake8'
call vundle#end()
"config filrtype
filetype plugin indent on
"remap keys of changing win
nnoremap <c-LEFT> <c-w>h
nnoremap <c-DOWN> <c-w>j
nnoremap <c-UP> <c-w>k
nnoremap <c-RIGHT> <c-w>l
"make backspace more useful
set backspace=indent,eol,start
"set indent
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
"config for python
au BufNewFile,BufRead *.py
\set tabstop=4
\set softtabstop=4
\set shiftwidth=4
\set textwidth=79
\set expandtab
\set autoindent
\set fileformat = unix
"set coding mode
set encoding=utf-8
"add line number
set nu
"work mouse
set mouse=a
"change color
let python_highlight_all=1
colorscheme freya
syntax on
"config file tree
map <f8> :NERDTreeToggle<cr>
"au vimenter * NERDTree
au vimenter * wincmd p
au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

imap () ()<Left>
imap [] []<Left>
imap {} {}<Left>
imap "" ""<Left>
imap '' ''<Left>

set hlsearch

hi Pmenu ctermfg=Black ctermbg=Grey
hi PmenuSel ctermfg=LightBlue ctermbg=DarkBlue

map <f5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'python'
		exec "!time python3 %"
	endif
endfunc
