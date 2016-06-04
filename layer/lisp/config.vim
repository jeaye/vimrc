call neobundle#append()
  NeoBundleLazy 'kovisoft/slimv', {
    \ 'autoload' : { 'filetypes' : ['lisp'] },
  \ }
call neobundle#end()

" Disable paredit
let g:paredit_mode = 0
let g:paredit_electric_return = 0

" Run sbcl from slimv
let g:slimv_swank_cmd = '! urxvt -e sbcl --load ~/.vim/bundle/slimv/slime/start-swank.lisp &'
