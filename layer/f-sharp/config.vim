call neobundle#append()
  NeoBundle 'fsharp/vim-fsharp', {
        \ 'depends': 'scrooloose/syntastic',
        \ 'lazy': 1,
        \ 'autoload': {'filetypes': 'fsharp'},
        \ 'build': {
        \   'unix':  'make fsautocomplete',
        \ },
        \ 'build_commands': ['curl', 'make', 'mozroots', 'touch', 'unzip'],
        \}
call neobundle#end()
