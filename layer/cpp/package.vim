if !has('nvim')
  Plug 'jeaye/color_coded', {
    \ 'do': 'cmake . && make && make install',
  \ }
endif
Plug 'derekwyatt/vim-fswitch', {
  \ 'for': ['c', 'cpp', 'objc', 'objcpp'],
\ }
