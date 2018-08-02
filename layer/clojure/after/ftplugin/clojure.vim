" How many lines to consider for indentation correctness; it's large
let g:clojure_maxlines = 10000

" Line up doc strings vertically
let g:clojure_align_multiline_strings = 1

let g:sexp_enable_insert_mode_mappings = 0

nnoremap cq% :%Eval<CR>:Last!<CR>

nmap cpo :silent! execute "normal \<Plug>FireplaceCountPrint"<CR>:Last!<CR>
