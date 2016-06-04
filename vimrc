" No vi compatibility
set nocompatible

let g:hostname = substitute(system('hostname'), "\n", "", "")
let g:lightweight = g:hostname == "nixums"
let g:python_host_prog='/usr/bin/python' " TODO: neovim layer

source $HOME/.vim/layer/dein/start.vim

filetype plugin indent on
