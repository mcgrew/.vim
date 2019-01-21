" .vimrc

scriptencoding utf-8
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
" Set tab width to 8.
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

function Python_settings( )
  map <F4> ^y0o<ESC>0DpA<TAB>"""<ESC>yypO:Parameters:<CR><CR>rtype:<SPACE><CR>return:<SPACE><ESC>3k0
  map <C-_> :s/^/#/<CR>:s/^##//<CR>:let @/=""<CR>
endfunction

function Sh_settings( )
  map <F4> ^y0O<ESC>0DpA##<SPACE><ESC>yypPA<SPACE>
  map <C-_> :s/^/#/<CR>gv:s/^##//<CR>:let @/=""<CR>
endfunction

function Sql_settings( )
  map <F4> ^y0O<ESC>0DpA--<SPACE><ESC>yypPA<SPACE>
  map <C-_> :s/^/--/<CR>gv:s/^----//<CR>:let @/=""<CR>
endfunction

function Default_settings( )
  map <F4> ^y0O<ESC>0DpA/**<CR><SPACE>*/<ESC>O*<SPACE><ESC>yyppA@param<SPACE><ESC>pA@return<SPACE><ESC>3kA
  map <C-_> :s/^/\/\//<CR>gv:s/^\/\/\/\///<CR>:let @/=""<CR>
endfunction

" Settings based on filetype
autocmd bufenter,bufcreate * 
\ if &ft == "python" 
  \ |  call Python_settings( )
\ | elseif &ft == "sql" 
  \ | call Sql_settings( )
\ | elseif &ft == "lua" 
  \ | call Sql_settings( )
\ | elseif &ft == "sh" 
  \ | call Sh_settings( )
\ | else
  \ | call Default_settings( )
\| endif

autocmd bufnewfile *.html call setline(1,"<!DOCTYPE html>") 
                      \ | call setline(2, "<html>" ) 
                      \ | call setline(3, "  <head>") | call setline(4, "  </head>")
                      \ | call setline(5, "  <body>") | call setline(6, "  </body>")
                      \ | call setline(7, "</html>")
autocmd bufnewfile *.php call setline(1,"<?php") | call setline(2,"?>")
autocmd bufnewfile *.sh call setline(1,"#!/bin/bash")
autocmd bufnewfile *.svg call setline(1,'<?xml version="1.0" encoding="ISO-8859-1"?>')
                      \ | call setline(2, '<svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 128 128">')
                      \ | call setline(3, '</svg>')
autocmd bufnewfile *.go call setline(1,"")
                    \ | call setline(2, "import (" ) 
                    \ | call setline(3, ")" ) 

"Map <F1> to <ESC>, since I hit it a lot by mistake.
map <F1> <ESC>
imap <F1> <ESC>

map <C-t> :NERDTreeToggle<CR>

