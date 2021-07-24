augroup scheme
  autocmd BufNewFile,BufRead *.scm nnoremap <leader>eb :ConjureEvalBuf<cr>
  autocmd BufNewFile,BufRead *.scm nnoremap <leader>ee :ConjureEvalCurrentForm<cr>
  autocmd BufNewFile,BufRead *.scm nnoremap <leader>ef :ConjureEvalFile<cr>
  autocmd BufNewFile,BufRead *.scm nnoremap <leader>er :ConjureEvalRootForm<cr>
  autocmd BufNewFile,BufRead *.scm nnoremap <leader>ew :ConjureEvalWord<cr>
  autocmd BufNewFile,BufRead *.scm nnoremap <leader>lq :ConjureLogCloseVisible<cr>
  autocmd BufNewFile,BufRead *.scm nnoremap <leader>lr :ConjureLogResetSoft<cr>
  autocmd BufNewFile,BufRead *.scm nnoremap <leader>lv :ConjureLogVSplit<cr>
augroup end
