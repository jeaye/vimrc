" No vi compatibility
set nocompatible

source $HOME/.vim/config/debug.vim
source $HOME/.vim/config/neobundle.vim
source $HOME/.vim/config/color.vim
source $HOME/.vim/config/ui.vim
source $HOME/.vim/config/indent.vim
source $HOME/.vim/config/save.vim
source $HOME/.vim/config/airline.vim
source $HOME/.vim/config/search.vim
source $HOME/.vim/config/motion.vim
source $HOME/.vim/config/completion.vim
source $HOME/.vim/config/git.vim
source $HOME/.vim/config/mutt.vim
source $HOME/.vim/config/lisp.vim
source $HOME/.vim/config/clojure.vim
source $HOME/.vim/config/buffer.vim
source $HOME/.vim/config/c++.vim
source $HOME/.vim/config/jank.vim

" Prompt to install missing bundles
NeoBundleCheck

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif

filetype plugin indent on
