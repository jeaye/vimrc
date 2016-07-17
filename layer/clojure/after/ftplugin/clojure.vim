echomsg "Clojure"
" How many lines to consider for indentation correctness; it's large
let g:clojure_maxlines = 10000

" Line up doc strings vertically
let g:clojure_align_multiline_strings = 1

" Evaluate Clojure buffers on load
"autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

" Boot support
autocmd BufNewFile,BufRead *.boot setfiletype clojure
autocmd BufNewFile,BufRead *.edn setfiletype clojure

nnoremap cq% :%Eval<CR>

command! Arcadia VimShellInteractive ruby Assets/Arcadia/Editor/repl-client.rb
