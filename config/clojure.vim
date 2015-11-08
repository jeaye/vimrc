call neobundle#append()
  " Lazy load these based on filetype
  NeoBundle 'tpope/vim-classpath'
  NeoBundle 'tpope/vim-salve'
  NeoBundle 'tpope/vim-projectionist'
  NeoBundle 'tpope/vim-dispatch'
  NeoBundle 'tpope/vim-fireplace'
  NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'
  NeoBundle 'guns/vim-sexp'
  NeoBundle 'guns/vim-clojure-highlight'
  NeoBundle 'guns/vim-clojure-static'
call neobundle#end()

" How many lines to consider for indentation correctness; it's large
let g:clojure_maxlines = 10000

" Line up doc strings vertically
let g:clojure_align_multiline_strings = 1

" Evaluate Clojure buffers on load
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry
autocmd BufWrite *.clj ClojureHighlightReferences
