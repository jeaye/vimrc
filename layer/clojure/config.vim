autocmd BufNewFile,BufRead *.mongo setfiletype clojure
autocmd BufNewFile,BufRead *.boot setfiletype clojure
autocmd BufNewFile,BufRead *.edn setfiletype clojure

let g:conjure_log_auto_close = v:false

nmap <Leader>cp :ConjurePiggieback (figwheel-sidecar.repl-api/repl-env)<CR>

"" Fireplace
"autocmd FileType clojure nnoremap <buffer> <localleader>ee :Eval<cr>
"autocmd FileType clojure vnoremap <buffer> <localleader>ee :Eval<cr>
"autocmd FileType clojure nnoremap <buffer> <localleader>eb :%Eval<cr>
"autocmd FileType clojure nnoremap <buffer> <localleader>rr :Require<cr>
"autocmd FileType clojure nnoremap <buffer> <localleader>rR :Require!<cr>
"autocmd FileType clojure nnoremap <buffer> <localleader>et :RunTests<cr>
"autocmd FileType clojure nnoremap <buffer> <localleader>el :Last<cr>
"autocmd FileType clojure nnoremap <buffer> <localleader>ec :FireplaceConnect<cr>
"autocmd FileType clojure nnoremap <buffer> gd :normal [<c-d><cr>
