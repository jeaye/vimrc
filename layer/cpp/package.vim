if !has('nvim')
  Plug 'jeaye/color_coded', {
    \ 'do': 'rm -f CMakeCache.txt && cmake . && make install',
  \ }
endif
Plug 'derekwyatt/vim-fswitch', {
  \ 'for': ['c', 'cpp', 'objc', 'objcpp'],
\ }
