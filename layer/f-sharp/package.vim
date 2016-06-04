call dein#add('fsharp/vim-fsharp', {
      \ 'depends': 'scrooloose/syntastic',
      \ 'on_ft': ['fsharp'],
      \ 'build': 'make fsautocomplete',
\ })
