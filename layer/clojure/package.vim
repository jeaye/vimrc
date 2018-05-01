Plug 'guns/vim-sexp', {
      \ 'for': ['clojure'],
\ }
Plug 'tpope/vim-sexp-mappings-for-regular-people', {
      \ 'for': ['clojure'],
\ }

autocmd BufNewFile,BufRead *.boot setfiletype clojure
autocmd BufNewFile,BufRead *.edn setfiletype clojure
