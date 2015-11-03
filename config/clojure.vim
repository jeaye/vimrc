call neobundle#append()
  " Lazy load these based on filetype
  NeoBundle 'tpope/vim-classpath'
  NeoBundle 'tpope/vim-salve'
  NeoBundle 'tpope/vim-projectionist'
  NeoBundle 'tpope/vim-dispatch'
  NeoBundle 'tpope/vim-fireplace'
call neobundle#end()

" How many lines to consider for indentation correctness; 0 = unlimited
let g:clojure_maxlines = 0

" Line up doc strings vertically
let g:clojure_align_multiline_strings = 1
