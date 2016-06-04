call dein#add('jeaye/color_coded', {
  \ 'build': 'cmake . && make && make install',
  \ 'on_ft': ['c', 'cpp', 'objc', 'objcpp'],
  \ 'disabled': has('nvim'),
\ })
