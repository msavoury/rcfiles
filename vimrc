"this has to be the first line to allow all the new Vim features 
set nocompatible

"enable syntax highlighting
syntax on

"set up our indenting
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4

"highlight all search results
set hlsearch

"match braces
set showmatch

"set the statusline with current cursor position
set ruler

set incsearch  "search for text as it is entered
set ignorecase "ignore the case when searching
set smartcase  "but only if the search doesn't have different cases

"highlight the current line
set cursorline

"always show the statusline
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

set scrolljump=5 "lines to jump when curose leaves screen
set scrolloff=3  "minimum lines to keep above and below cursor

set complete=k~/.vim/dict/php.dict "enable our php dictionary (file must be present"

"we can use jj to escape from insert mode becuase who types that anyway?
"omg that means we don't have to strain that pinky anymore!
:inoremap jj <Esc>

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
