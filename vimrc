" No vi compatibility
set nocompatible

let g:hostname = substitute(system('hostname'), "\n", "", "")
let g:is_nixos = system('uname -a') =~ "NixOS"
let g:lightweight = g:hostname == "nixums"
let g:python3_host_prog='/usr/local/bin/python3'

source $HOME/.vim/layer/all-packages.vim

filetype plugin indent on
