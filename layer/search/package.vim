" File finding
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'

" Pattern finding
if !g:is_nixos
  Plug 'mileszs/ack.vim'
  Plug 'ggreer/the_silver_searcher', { 'do': '../../build/silver-searcher' }
endif
