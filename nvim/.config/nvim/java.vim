let test#java#runner = "gradletest"
let test#java#gradletest#executable = "./gradlew test"

augroup java
  autocmd BufWritePost *.java lua require('jdtls').organize_imports()
augroup end
