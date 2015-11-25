"this has to be the first line to allow all the new Vim features 
set nocompatible


" Start vundle specific stuff
filetype off                  " required
"INSTALLING VUNDLE THE FIRST TIME: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'flazz/vim-colorschemes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'derekwyatt/vim-scala'


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
" END VUNDLE STUFF 
"

"CtrlP Plugin Settings
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

"set number of available terminal colors
set t_Co=256

"enable syntax highlighting
set background=dark
syntax on
colorscheme wasabi256 

"use relative line numbers
set relativenumber

"5/10 of a second to highlight matching parens
set matchtime=5


"set up our indenting

"indent according to matching braces for code
set smartindent

"indent to same level of previous line when creating new line
set autoindent

"number of spaces to use for each step of autoindent
set shiftwidth=4

"highlight all search results
set hlsearch

"highlight matching braces
set showmatch

"set the statusline with current cursor position
set ruler

"make backspace key work like normal
set backspace=indent,eol,start

set incsearch  "search for text as it is entered
set ignorecase "ignore the case when searching
set smartcase  "but only if the search doesn't have different cases

"highlight the current line
set cursorline

"always show the statusline
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [LINE=%l/%L][%p%%]\ %{strftime(\"%m/%d/%y\ -\ %H:%M\")}

set scrolloff=3  "minimum lines to keep above and below cursor

set virtualedit=onemore " allow for cursor beyond last character
set history=1000 " Store a ton of history (default is 20)

"disable swap files that clutter working directory 
set directory=~/.backup//

" Remove trailing whitespaces and ^M chars
autocmd FileType c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
au BufRead,BufNewFile *.module set filetype=php
au BufRead,BufNewFile *.install set filetype=php

au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

let g:nerdtree_tabs_open_on_console_startup=1

"set map leader key
let mapleader = ","

"shortcuts for editing/sourcing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"shortcuts for switching windows
nnoremap <leader>swl <c-w>l<cr>
nnoremap <leader>swh <c-w>h<cr>
nnoremap <leader>swj <c-w>j<cr>
nnoremap <leader>swk <c-w>k<cr>
"
"nerdtree shortcuts
nnoremap <leader>nto :NERDTreeTabsOpen<cr>
nnoremap <leader>ntc :NERDTreeTabsClose<cr>

"Disable the use of escape & arrow keys in insert mode
inoremap jk <esc>
inoremap <esc> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

"Insert newline w/o entering insert mode
"nnoremap <CR>j o<Esc>k
"nnoremap <CR>k O<Esc>j


" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
