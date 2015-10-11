" No vi compatibility
set nocompatible
" Don't check for vim modelines at the end of files
set nomodeline

" TODO
" Unite?

source $HOME/.vim/config/neobundle.vim
source $HOME/.vim/config/color.vim
source $HOME/.vim/config/ui.vim
source $HOME/.vim/config/indent.vim
source $HOME/.vim/config/save.vim
source $HOME/.vim/config/airline.vim
source $HOME/.vim/config/search.vim
source $HOME/.vim/config/motion.vim
source $HOME/.vim/config/completion.vim

" Prompt to install missing bundles
NeoBundleCheck

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif

filetype plugin indent on
