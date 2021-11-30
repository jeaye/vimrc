autocmd BufNewFile,BufRead *.mongo setfiletype clojure
autocmd BufNewFile,BufRead *.boot setfiletype clojure
autocmd BufNewFile,BufRead *.edn setfiletype clojure

let g:conjure_log_auto_close = v:false

"lua require('aniseed.dotfiles')

nmap <Leader>cp :ConjurePiggieback (figwheel-sidecar.repl-api/repl-env)<CR>
