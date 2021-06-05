" remove trailing whitespace when manually saving a buffer
fun! <sid>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <sid>StripTrailingWhitespaces()
