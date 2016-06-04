" No vi compatibility
set nocompatible

" TODO: Bring in vim-taskwarrior

let g:hostname = substitute(system('hostname'), "\n", "", "")
let g:lightweight = g:hostname == "nixums"
let g:python_host_prog='/usr/bin/python' " TODO: neovim layer

source $HOME/.vim/config/neobundle/config.vim

filetype plugin indent on
