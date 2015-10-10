" No vi compatibility
set nocompatible
" Don't check for vim modelines at the end of files
set nomodeline

" TODO
" Unite?

source config/neobundle.vim
source config/color.vim
source config/ui.vim

" Prompt to install missing bundles
NeoBundleCheck

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif
