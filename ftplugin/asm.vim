" F4 will create a function documentation block when on the declaration line
nmap <F4> O;<SPACE><ESC>78a=<ESC>030l
nmap <C-_> :s/^/;/<CR>:s/^;;//<CR>:let @/=""<CR>
vmap <C-_> :s/^/;/<CR>gv:s/^;;//<CR>:let @/=""<CR>
