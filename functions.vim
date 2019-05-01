" Toggle mouse support on/off. Useful for cut/paste.
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
        echo "Mouse disabled"
    else
        " enable mouse everywhere
        set mouse=a
        echo "Mouse enabled"
    endif
endfunc

" Comment/uncomment the current line(s)
function! ToggleComment()
  let c = split(&commentstring, "%s")
  if getline('.') =~ "^" . c[0][0] " if this line is commented out, uncomment
    if len(c) == 1 " if it's a full line comment
      call setline(line('.'), getline('.')[len(c[0]):])
    else " if the comment type is a surround
      call setline(line('.'), getline('.')[len(c[0]):-len(c[1])-1])
    endif
  else " if the line is not commented out, comment it
    call setline(line('.'), printf(&commentstring, getline('.')))
  endif
endfunction

" Show the differences from the specified git revision in a scratch window
function! Diff(revision)
  let filepath = @%
  let diff_filetype = &ft
  diffthis
  set nofoldenable
  vnew
  set modifiable
  let filepath = system('git ls-files --full-name ' . filepath)
  put=system('git show ' . a:revision . ':' . filepath)
  execute "0d_"
  let &ft = diff_filetype
  set nomodifiable
  set buftype=nofile
  diffthis
  set nofoldenable
  wincmd l
  echo ""
endfunc

function! NewHTMLFile()
  call setline(1,"<!DOCTYPE html>") 
  call setline(2, "<html>" ) 
  call setline(3, "  <head>")
  call setline(4, "  </head>")
  call setline(5, "  <body>")
  call setline(6, "  </body>")
  call setline(7, "</html>")
endfunc

function! NewPHPFile()
  call setline(1,"<?php")
  call setline(2,"?>")
endfunc

function! NewShFile()
  call setline(1,"#!/bin/bash")
endfunc

function! NewSVGFile()
  call setline(1, '<?xml version="1.0" encoding="ISO-8859-1"?>')
  call setline(2, '<svg xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0 0 128 128">')
  call setline(3, '</svg>')
endfunc

function! NewGoFile()
  call setline(1,"")
  call setline(2, "import (" ) 
  call setline(3, ")" ) 
endfunc

function! NewJavaFile()
  call setline(1, "" ) 
  call setline(2, join(["public class", expand('%:r:t'), "{"]))
  call setline(3, "" ) 
  call setline(4, join(["  public ", expand('%:r:t'), "() {"], ""))
  call setline(5, "  }" ) 
  call setline(6, "}" ) 
endfunc

