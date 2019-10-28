let test#python#runner = 'pytest'

"autocmd BufWritePre *.py execute ':Black'
let g:black_linelength = 79
let g:black_skip_string_normalization = 1

autocmd FileType python nmap <Leader>bl :Black<CR>
