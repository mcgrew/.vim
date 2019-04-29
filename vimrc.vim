" .vimrc

scriptencoding utf-8
source ~/.vim/functions.vim
source ~/.vim/git.vim
source ~/.vim/plugins.vim

colorscheme gruvbox
set listchars=tab:⇥•,trail:•,eol:↵
set list

" Smart tabbing / autoindenting
set undolevels=100
set nocompatible
set autoindent
set smartindent
set smarttab
" Convert tabs to spaces
set expandtab

" Allow backspace to back over lines
" set backspace=2

set exrc
" Set tab width to 2.
set shiftwidth=2
set tabstop=2
set softtabstop=2
" I like it writing automatically on swapping
set autowrite
set noshowcmd
if exists('&selection')
  set selection=exclusive
endif

" show line numbers
set number
" I use a dark terminal background
set background=dark

" Ignore whitespace in vimdiff
set diffopt+=iwhite

" Turn off line wrapping
set nowrap

if version >= 703
  " Highlight the 80 char mark
  set colorcolumn=81,121
  highlight ColorColumn ctermbg=8
endif

" enable the mouse in terminal
set mouse=a

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Change the error format
set efm=%*[^\ ]\ %t%n\ %f\ %l:\ %m,%\\s%#%f(%l)\ :\ %t%*[^0-9]%n:\ %m,%*[^\"]\"%f\"%*[^0-9]%l:\ %m,%\\s%#%f(%l)\ :\ %m,%*[^\ ]\ %f\ %l:\ %m,%f:%l:%m,%t%*[^\ ]\ %f\ %l:\ %m,%t%*[^:]:\ \ %f(%l\\,%c):%m,%f:%l:%m,%t%*[^\ ]\ %f\ %l\ %c:\ %m 

" This changes the status bar highlight slightly from the default
" " set highlight=8b,db,es,mb,Mn,nu,rs,ss,tb,vr,ws

"I like things quiet
"set visualbell
" Give some room for errors
set cmdheight=2
" always show a status line
set laststatus=2
" show cursor position
set ruler
" Use a viminfo file
set viminfo='20,\"50
"set textwidth=80        " always limit the width of text to 80
"set textwidth=120        " always limit the width of text to 120
"set backup              " keep a backup file
" I like having history
set history=100

" Map Y do be an analog of D
map Y y$
" Toggle paste 
map zp :set paste! paste?<CR>

noremap g, ,
" Go to old line + column
noremap gf gf`"
noremap <C-^> <C-^>`"

" Map control-cr to goto new line without comment leader
imap <C-CR> <ESC>o

" Look at syntax attribute
nmap <F4> :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
nmap <S-F4> :echo synIDattr(synID(line("."), col("."), 0), "name")<CR>
" delete the swap file
nmap \\. :echo strpart("Error  Deleted",7*(0==delete(expand("%:p:h")."/.".expand("%:t").".swp")),7)<cr> 
" delete prev word
imap <C-BS> <c-w>

set display+=lastline
" set printoptions=syntax:y,wrap:y

" Switch on syntax highlighting.
syntax on


" F4 will create a function documentation block when on the declaration line
map <F4> ^y0O<ESC>0DpA/**<CR><SPACE>*/<ESC>O*<SPACE><ESC>yyppA@param<SPACE><ESC>pA@return<SPACE><ESC>3kA
map <C-_> :s/^/\/\//<CR>gv:s/^\/\/\/\///<CR>:let @/=""<CR>

autocmd bufnewfile *.html call NewHTMLFile()
autocmd bufnewfile *.php call NewPHPFile()
autocmd bufnewfile *.sh call NewShFile()
autocmd bufnewfile *.svg call NewSVGFile()
autocmd bufnewfile *.go call NewGoFile()
autocmd bufnewfile *.java call NewJavaFile()

" Map <F1> to <ESC>, since I hit it a lot by mistake.
map <F1> <ESC>
imap <F1> <ESC>

" Some shortcuts for navigating between windows
nmap <C-H> :wincmd h<CR>:echo "Editing" @%<CR>
nmap <C-J> :wincmd j<CR>:echo "Editing" @%<CR>
nmap <C-K> :wincmd k<CR>:echo "Editing" @%<CR>
nmap <C-L> :wincmd l<CR>:echo "Editing" @%<CR>

nmap <C-M> :call ToggleMouse()<CR>

