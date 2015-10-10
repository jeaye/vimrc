call neobundle#append()
  NeoBundle 'altercation/vim-colors-solarized'
call neobundle#end()

set background=dark
colorscheme solarized

" Color conceal characters nicely
hi Conceal guifg=green ctermfg=green
