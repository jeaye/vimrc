" No vi compatibility
set nocompatible

" TODO: Bring in vim-taskwarrior

let g:hostname = substitute(system('hostname'), "\n", "", "")
let g:lightweight = g:hostname == "nixums"

source $HOME/.vim/config/debug.vim
source $HOME/.vim/config/neobundle.vim
source $HOME/.vim/config/color.vim
source $HOME/.vim/config/ui.vim
source $HOME/.vim/config/indent.vim
source $HOME/.vim/config/save.vim
source $HOME/.vim/config/airline.vim
source $HOME/.vim/config/search.vim
source $HOME/.vim/config/motion.vim
source $HOME/.vim/config/git.vim
source $HOME/.vim/config/mutt.vim
source $HOME/.vim/config/jank.vim
source $HOME/.vim/config/markdown.vim
source $HOME/.vim/config/nix.vim
source $HOME/.vim/config/buffer.vim

if !g:lightweight
  source $HOME/.vim/config/completion.vim
  source $HOME/.vim/config/color_coded.vim
  source $HOME/.vim/config/lisp.vim
  source $HOME/.vim/config/clojure.vim
  source $HOME/.vim/config/c++.vim
endif

" Prompt to install missing bundles
NeoBundleCheck

if !has('vim_starting')
  " Call on_source hook when reloading .vimrc.
  call neobundle#call_hook('on_source')
endif

filetype plugin indent on
