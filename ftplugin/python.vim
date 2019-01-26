" F4 will create a function documentation block when on the declaration line
nmap <F4> ^y0o<ESC>0DpA<TAB>"""<ESC>yypO:Parameters:<CR><CR>rtype:<SPACE><CR>return:<SPACE><ESC>3k0
nmap <C-_> :s/^/#/<CR>:s/^##//<CR>:let @/=""<CR>
vmap <C-_> :s/^/#/<CR>gv:s/^##//<CR>:let @/=""<CR>
