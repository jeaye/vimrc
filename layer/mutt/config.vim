call neobundle#append()
  NeoBundle 'chrisbra/CheckAttach', {
    \ 'autoload': { 'filetypes' : ['mail'] },
  \ }
call neobundle#end()

" Unlimited text width
au BufRead /tmp/mutt-* set tw=0

autocmd FileType mail set spell
