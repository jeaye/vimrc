" No vi compatibility
set nocompatible
" Don't check for vim modelines at the end of files
set nomodeline
" Improves speed of drawing and smoothness of scrolling
set ttyfast

" TODO
" Unite?

source config/neobundle.vim
source config/color.vim

" Prompt to install missing bundles
NeoBundleCheck

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif
