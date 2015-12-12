call neobundle#append()
  NeoBundle 'jceb/vim-orgmode'
call neobundle#end()

au BufRead,BufNewFile */reminders set filetype=remind
