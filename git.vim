
function! Diff(revision)
  let filepath = @%
  let diff_filetype = &ft
  set nofoldenable
  diffthis
  vnew
  set modifiable
  let filepath = system('git ls-files --full-name ' . filepath)
  put=system('git show ' . a:revision . ':' . filepath)
  execute "0d_"
  let &ft = diff_filetype
  set nomodifiable
  set buftype=nofile
  set nofoldenable
  diffthis
  wincmd l
  echo ""
endfunc

map <C-D> :call Diff("HEAD")<CR>
map <C-P> :call Diff("HEAD^")<CR>

