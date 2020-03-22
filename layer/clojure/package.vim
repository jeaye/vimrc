Plug 'guns/vim-sexp', {
      \ 'for': ['clojure'],
\ }
Plug 'tpope/vim-sexp-mappings-for-regular-people', {
      \ 'for': ['clojure'],
\ }
"Plug 'tpope/vim-fireplace'
Plug 'Olical/conjure', { 'tag': 'v2.1.2', 'do': 'bin/compile'  }

autocmd BufNewFile,BufRead *.boot setfiletype clojure
autocmd BufNewFile,BufRead *.edn setfiletype clojure
