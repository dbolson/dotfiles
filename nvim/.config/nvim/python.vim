let test#python#runner = 'pytest'

"autocmd BufWritePre *.py execute ':Black'
let g:black_linelength = 79
let g:black_skip_string_normalization = 1

let test#python#pytest#options = {
  \ 'all': '-q',
\}

autocmd FileType python nmap <Leader>bl :Black<CR>
autocmd FileType python nmap <Leader>is :Isort<CR>
