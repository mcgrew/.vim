" F4 will create a function documentation block when on the declaration line
nmap <C-_> :s/^/#/<CR>:s/^##//<CR>:let @/=""<CR>
vmap <C-_> :s/^/#/<CR>gv:s/^##//<CR>:let @/=""<CR>
