" No vi compatibility
set nocompatible

let g:hostname = substitute(system('hostname'), "\n", "", "")
let g:lightweight = g:hostname == "nixums"
let g:python_host_prog='/usr/bin/python'

source $HOME/.vim/layer/lazy.vim
source $HOME/.vim/layer/dein.vim

filetype plugin indent on
