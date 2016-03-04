call neobundle#append()
  NeoBundleLazy 'jeaye/color_coded', {
    \ 'build': {
    \   'unix': 'cmake . && make && make install',
    \ },
    \ 'autoload': { 'filetypes' : ['c', 'cpp', 'objc', 'objcpp'] },
    \ 'build_commands': ['cmake', 'make'],
    \ 'disabled': has('nvim'),
  \ }
call neobundle#end()

" Disable color_coded in diff mode
if &diff
  let g:color_coded_enabled = 0
endif
