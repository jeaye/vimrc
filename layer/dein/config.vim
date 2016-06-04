" Install NeoBundle, if it doesn't exist
" Credit: https://github.com/tony/vim-config
"let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
"if !filereadable(neobundle_readme)
"  echo "Installing neobundle.vim"
"  echo ""
"  silent !mkdir -p ~/.vim/bundle
"  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"endif

if has('vim_starting')
  set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
  "set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"call neobundle#begin(expand('~/.vim/bundle/'))
"  NeoBundleFetch 'Shougo/neobundle.vim'
"call neobundle#end()

" Give big plugins a while to install
"let g:neobundle#install_process_timeout = 1500

call dein#begin(expand('~/.vim/dein'))
  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {
      \ 'build': {
      \     'mac': 'make -f make_mac.mak',
      \     'linux': 'make',
      \     'unix': 'gmake',
      \    },
      \ })

  let files = globpath($HOME . "/.vim/config", "**/package.vim")
  for f in split(files, "\n")
    echom "Loading layer" f
    exe "source" f
  endfor
call dein#end()
