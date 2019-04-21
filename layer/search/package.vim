" File finding
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'

" Pattern finding
Plug 'mileszs/ack.vim'
if !g:is_nixos
  Plug 'ggreer/the_silver_searcher', { 'do': './build.sh' }
endif
