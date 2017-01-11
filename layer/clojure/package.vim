"Plug 'paredit.vim', {
"      \ 'for': ['clojure'],
"\ }
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-salve', {
      \ 'for': ['clojure'],
\ }
Plug 'guns/vim-sexp', {
      \ 'for': ['clojure'],
\ }
Plug 'tpope/vim-sexp-mappings-for-regular-people', {
      \ 'for': ['clojure'],
\ }
Plug 'tpope/vim-fireplace', {
      \ 'for': ['clojure'],
\ }

autocmd BufNewFile,BufRead *.boot setfiletype clojure
autocmd BufNewFile,BufRead *.edn setfiletype clojure
