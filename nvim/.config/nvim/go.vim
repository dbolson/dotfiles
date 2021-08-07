" launchdarkly-specific
let test#go#gotest#executable = 'GONFALON_MODE=test go test'
" ctrl-o to enter normal mode in test window
if has('nvim')
  tmap <c-o> <c-\><c-n>
endif

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
autocmd BufWritePre *.go lua require('dbolson.go').goimports()
