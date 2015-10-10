" No vi compatibility
set nocompatible
" Don't check for vim modelines at the end of files
set nomodeline
" Improves speed of drawing and smoothness of scrolling
set ttyfast

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" TODO: bundles
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

call neobundle#end()

filetype plugin indent on

" Prompt to install missing bundles
NeoBundleCheck
