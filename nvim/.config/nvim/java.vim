augroup java
  autocmd BufWritePost *.java lua require('jdtls').organize_imports()
augroup end
