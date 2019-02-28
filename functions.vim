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

