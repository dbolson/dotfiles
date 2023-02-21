augroup racket,scheme
  autocmd BufNewFile,BufRead *.rkt nnoremap <leader>eb :ConjureEvalBuf<cr>
  autocmd BufNewFile,BufRead *.rkt nnoremap <leader>ee :ConjureEvalCurrentForm<cr>
  autocmd BufNewFile,BufRead *.rkt nnoremap <leader>ef :ConjureEvalFile<cr>
  autocmd BufNewFile,BufRead *.rkt nnoremap <leader>er :ConjureEvalRootForm<cr>
  autocmd BufNewFile,BufRead *.rkt nnoremap <leader>ew :ConjureEvalWord<cr>
  autocmd BufNewFile,BufRead *.rkt nnoremap <leader>lq :ConjureLogCloseVisible<cr>
  autocmd BufNewFile,BufRead *.rkt nnoremap <leader>lr :ConjureLogResetSoft<cr>
  autocmd BufNewFile,BufRead *.rkt nnoremap <leader>lR :ConjureLogResetHard<cr>
  autocmd BufNewFile,BufRead *.rkt nnoremap <leader>lv :ConjureLogVSplit<cr>
augroup end
